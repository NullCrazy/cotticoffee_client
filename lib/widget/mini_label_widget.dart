import 'package:cotticoffee_client/global/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/16 9:23 PM
class MiniLabelWidget extends StatelessWidget {
  EdgeInsets? textPadding;
  String? label;

  MiniLabelWidget({Key? key, this.textPadding, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: label?.isEmpty ?? true,
      child: Container(
        padding: textPadding ?? EdgeInsets.all(2.w),
        color: const Color(0xFFFBE7E5),
        child: Text(
          label ?? '',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: primeColor,
            fontSize: 10.sp,
          ),
          strutStyle: StrutStyle(
            forceStrutHeight: true,
            fontSize: 10.sp,
          ),
        ),
      ),
    );
  }
}
