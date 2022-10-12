import 'package:cotticoffee_client/widget/cotti_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'abite_pay.dart';
import 'model/pay_type_list_model.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/3/14 11:06 下午
class PayListWidget extends StatefulWidget {
  const PayListWidget({Key? key, this.itemPadding, this.callBack}) : super(key: key);
  final EdgeInsets? itemPadding;
  final Function(PayTypeModel)? callBack;

  @override
  State<PayListWidget> createState() => _PayListWidgetState();
}

class _PayListWidgetState extends State<PayListWidget> {
  PayTypeListModel? _payTypeList;
  int selectIndex = 0;

  @override
  void initState() {
    super.initState();
    AbitePay().abitePayList().then((value) {
      setState(() {
        _payTypeList = value;
        if (widget.callBack != null && (_payTypeList?.payTypeList?.isNotEmpty ?? false)) {
          selectIndex = 0;
          widget.callBack!(_payTypeList!.payTypeList![0]);
        }
      });
    }).catchError((onError) {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: _payTypeList?.payTypeList?.length ?? 0,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        PayTypeModel payType = _payTypeList!.payTypeList![index];
        return InkWell(
          onTap: () {
            if (widget.callBack != null) {
              widget.callBack!(payType);
            }
            setState(() {
              selectIndex = index;
            });
          },
          child: Container(
            padding: widget.itemPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CottiImageWidget(
                      url: payType.showIcon ?? '',
                      imgW: 18.w,
                      imgH: 18.h,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      payType.showName ?? '',
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 23.w,
                  height: 23.h,
                  child: selectIndex == index
                      ? SvgPicture.asset("assets/images/radio_selected.svg")
                      : SvgPicture.asset("assets/images/radio_unselected.svg"),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          color: const Color(0xFFE5E5E5),
          height: 0.5.h,
        );
      },
    );
  }
}
