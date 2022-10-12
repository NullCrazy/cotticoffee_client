import 'dart:ui';

import 'package:cotticoffee_client/global/icon_font.dart';
import 'package:cotticoffee_client/global/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/11 3:09 PM
class CouponWidget extends StatelessWidget {
  const CouponWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.h,
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.fromLTRB(12.w, 12.w, 8.w, 12.w),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCoupon('优惠券', 0, '10张即将到期'),
          _buildCoupon('奖励金', 98, '10即将到期'),
        ],
      ),
    );
  }

  _buildCoupon(String title, num number, String? des) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '优惠券',
          style: TextStyle(
            fontSize: 12.sp,
            color: textGray,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '$number',
              style: TextStyle(
                color: textBlack,
                fontSize: 24.sp,
                fontFamily: 'DDP5',
              ),
              strutStyle: const StrutStyle(
                forceStrutHeight: true,
                height: 0.7,
              ),
            ),
            Offstage(
              offstage: des?.isEmpty ?? true,
              child: Container(
                margin: EdgeInsets.only(left: 4.w),
                child: Text(
                  des ?? '',
                  style: TextStyle(
                    color: textGray,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Offstage(
              offstage: des?.isEmpty ?? true,
              child: Icon(
                IconFont.icon_youjiantou,
                color: textGray,
                size: 12.w,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
