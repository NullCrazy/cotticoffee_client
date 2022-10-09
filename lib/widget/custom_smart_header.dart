import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/3/21 4:00 下午
class CustomSmartHeader extends StatelessWidget {
  const CustomSmartHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomHeader(builder: (context, mode) {
      return Center(
        child: Lottie.network(
          'https://cdn-product-prod.yummy.tech/wechat/cotti/images/refresh.json',
          width: 42.w,
          height: 42.w,
        ),
      );
    });
  }
}
