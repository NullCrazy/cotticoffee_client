import 'package:cotticommon/router/fluro_navigator.dart';
import 'package:flutter/material.dart';

import '../../routers/home_router.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/8/30 5:36 下午
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      NavigatorUtils.push(context, HomeRouter.homePage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
