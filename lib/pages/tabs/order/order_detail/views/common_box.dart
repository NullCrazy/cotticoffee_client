import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/20 2:57 PM
class CommonBox extends StatelessWidget {
  Widget? child;
  EdgeInsets? padding;

  CommonBox({Key? key, this.child, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.h),
      padding: padding ?? EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      child: child,
    );
  }
}
