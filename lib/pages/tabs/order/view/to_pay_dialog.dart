import 'package:cotticoffee_client/service/pay/abite_pay.dart';
import 'package:cotticoffee_client/service/pay/model/pay_type_list_model.dart';
import 'package:cotticoffee_client/service/pay/pay_list_view.dart';
import 'package:cotticoffee_client/utils/abite_pay_util.dart';
import 'package:cotticommon/cotticommon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/3/15 10:51 上午
class ToPayDialog extends StatefulWidget {
  const ToPayDialog(
      {Key? key,
      required this.payable,
      required this.orderId,
      required this.orderNo,
      this.callBack})
      : super(key: key);
  final double payable;
  final String orderId;
  final String orderNo;
  final Function(ABitePayResult)? callBack;

  @override
  State<ToPayDialog> createState() => _ToPayDialogState();

  static void show(BuildContext context, double payable, String orderId, String orderNo,
      Function(ABitePayResult)? callBack) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ToPayDialog(
          payable: payable,
          orderId: orderId,
          orderNo: orderNo,
          callBack: callBack,
        );
      },
    );
  }
}

class _ToPayDialogState extends State<ToPayDialog> {
  PayTypeModel? _payType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                child: Text(
                  "待支付",
                  style: TextStyle(
                    color: const Color(0xFF333333),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "¥",
                      style: TextStyle(
                        color: const Color(0xFFFF6A39),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "${widget.payable}",
                      style: TextStyle(
                        color: const Color(0xFFFF6A39),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      strutStyle: const StrutStyle(forceStrutHeight: true),
                    ),
                  ],
                ),
              ),
            ],
          ),
          PayListWidget(
            itemPadding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 20.w),
            callBack: (payType) => _payType = payType,
          ),
          SafeArea(
            top: false,
            child: Container(
              height: 68.h,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 40.w),
              child: GestureDetector(
                onTap: () {
                  if (_payType == null) {
                    ToastUtil.show("请选择支付方式");
                  } else {
                    AbitePay().pay(_payType!, widget.orderId, widget.orderNo).then((value) {
                      if (widget.callBack != null) {
                        widget.callBack!(value);
                      }
                      Navigator.pop(context);
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6A39),
                    borderRadius: BorderRadius.circular(26.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "去支付",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
