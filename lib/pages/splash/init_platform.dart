import 'dart:io';

import 'package:abitelogin/pages/login/view/one_key_login_helper.dart';
import 'package:cotticommon/cotticommon.dart';
import 'package:flutter/cupertino.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/8 4:51 PM
class InitPlatform {
  static Future<void> initPlatform(BuildContext context) async {
    _initShanyan();
    await SpUtil.getInstance();
  }

  static _initShanyan() {
    late String appId;
    if (Platform.isIOS) {
      appId = "KjqXhbeB";
    } else if (Platform.isAndroid) {
      appId = "MzPaKDDW";
    }
    // 初始化一键登录并预取号
    OneKeyLoginHelper.initAndGetPhoneInfo(appId);
  }
}
