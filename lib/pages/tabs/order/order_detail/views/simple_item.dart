import 'package:cotticoffee_client/global/style.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_detail/views/common_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/20 3:04 PM
class SimpleItem extends StatelessWidget {
  const SimpleItem({Key? key, required this.title, this.click}) : super(key: key);
  final String title;
  final Function? click;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (click != null) {
          click!();
        }
      },
      child: CommonBox(
        padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textBlack,
                fontSize: 14.sp,
              ),
            ),
            SvgPicture.asset(
              'assets/images/icon_more.svg',
              width: 16.w,
            ),
          ],
        ),
      ),
    );
  }
}
