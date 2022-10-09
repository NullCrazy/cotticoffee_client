import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/3/21 4:00 下午
class CustomSmartFooter extends StatelessWidget {
  const CustomSmartFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFooter(builder: (BuildContext context, LoadStatus? mode) {
      Widget body;
      if (mode == LoadStatus.idle) {
        body = const Text("上滑加载更多");
      } else if (mode == LoadStatus.loading) {
        body = Lottie.network(
          'https://cdn-product-prod.yummy.tech/wechat/cotti/images/refresh.json',
          width: 30.w,
          height: 30.w,
        );
      } else if (mode == LoadStatus.failed) {
        body = const Text("加载错误");
      } else if (mode == LoadStatus.noMore) {
        body = Text(
          "— 到底啦 —",
          style: TextStyle(color: const Color(0xFFCFCFCf), fontSize: 13.sp),
        );
      } else {
        body = const Text("");
      }
      return Container(
        alignment: Alignment.center,
        height: 55.h,
        child: body,
      );
    });
  }
}
