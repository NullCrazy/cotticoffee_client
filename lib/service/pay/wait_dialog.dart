import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/3/20 10:40 上午
class WaitDialog extends StatefulWidget {
  const WaitDialog({Key? key}) : super(key: key);

  @override
  State<WaitDialog> createState() => _WaitDialogState();

  static void show(BuildContext context, Function(BuildContext) call) {
    showDialog(
      context: context,
      builder: (context) {
        return const WaitDialog();
      },
    );
  }
}

class _WaitDialogState extends State<WaitDialog> {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lottie/loading.json',
      width: 52.w,
      height: 52.h,
    );
  }
}
