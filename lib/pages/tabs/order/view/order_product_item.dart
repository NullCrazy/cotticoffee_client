import 'package:cotticoffee_client/global/style.dart';
import 'package:cotticoffee_client/pages/tabs/order/model/order_model.dart';
import 'package:cotticoffee_client/widget/abite_image_widget.dart';
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
          width: 60.w,
          height: 60.h,
          child: Stack(
            children: [
              ABiteImageWidget(
                url: widget.productModel.picPath ?? '',
                imgW: 60.w,
                imgH: 60.h,
                fit: BoxFit.fill,
              ),
              Align(alignment: Alignment.bottomRight, child: _buildCount()),
            ],
          ),
        ),
        SizedBox(
          width: 60.w,
          child: Text(
            widget.productModel.title ?? '',
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: textGray,
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
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          bottomRight: Radius.circular(8.r),
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
