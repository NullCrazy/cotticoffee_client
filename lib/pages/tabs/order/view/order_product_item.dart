import 'package:cotticoffee_client/global/style.dart';
import 'package:cotticoffee_client/pages/tabs/order/model/order_model.dart';
import 'package:cotticoffee_client/widget/cotti_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/3/16 2:20 下午
class OrderProductItem extends StatefulWidget {
  const OrderProductItem({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;

  @override
  State<OrderProductItem> createState() => _OrderProductItemState();
}

class _OrderProductItemState extends State<OrderProductItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 64.w,
          height: 64.h,
          child: Stack(
            children: [
              CottiImageWidget(
                url: widget.productModel.picPath ?? '',
                imgW: 64.w,
                imgH: 64.h,
                borderRadius: BorderRadius.all(Radius.circular(4.r)),
                fit: BoxFit.fill,
              ),
              Align(alignment: Alignment.bottomRight, child: _buildCount()),
            ],
          ),
        ),
        SizedBox(
          width: 64.w,
          child: Text(
            widget.productModel.title ?? '',
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: textBlack,
              fontSize: 10.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCount() {
    return Container(
      padding: EdgeInsets.only(left: 6.w, right: 4.w, top: 2.h, bottom: 1.h),
      decoration: BoxDecoration(
        color: textBlack.withOpacity(0.4),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(4.r),
        ),
      ),
      child: Text(
        "x${widget.productModel.count ?? 0}",
        style: TextStyle(
          color: Colors.white,
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
        ),
        strutStyle: StrutStyle(
          forceStrutHeight: true,
          fontSize: 10.sp,
        ),
      ),
    );
  }
}
