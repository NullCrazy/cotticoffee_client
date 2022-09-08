import 'dart:async';
import 'dart:io';

import 'package:cotticommon/utils/log_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'privacy_policy_page.dart';

/// @ClassName: PrivacyMixin
///
/// @Description: 隐私协议
/// @author: hongtao.li@abite.com
/// @date: 2021-08-10
///
typedef PrivacyCheckCallback = void Function(bool result);
mixin PrivacyMixin {
  /// 检查隐私协议
  /// [callback]是否同意了协议
  static PrivacyCheckCallback? _callback;

  Future<bool> _isFirstLaunched() async {
    var agreeDateString = await _get('KStoreAgreePrivacy');
    if (agreeDateString.isEmpty) {
      return true;
    }
    return false;
  }

  checkPrivacyAgreement(BuildContext context, PrivacyCheckCallback callback) async {
    _callback = callback;
    bool flag = await _isFirstLaunched();
    if (flag == true) {
      /// 显示隐私协议
      logI('第一次启动，显示隐私协议');
      _showWidget(context);
    } else {
      try {
        // await requestPrivacyRuleConfig();
      } finally {
        bool display = await isShowPrivacyPolicy();
        if (display) {
          if (Platform.isAndroid) {
            // Timer(const Duration(milliseconds: 500), () {
            _showWidget(context);
            // });
          } else {
            _showWidget(context);
          }
        } else {
          _confirmPressed();
        }
      }
    }
  }

  /// XX隐私政策
  _showWidget(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration:
                      BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24.r)),
                  width: 335.w,
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 15.h),
                  child: PrivacyPolicyPage(
                    actionFunc: _actionBlock,
                    okButtonTitle: '同意',
                    cancelButtonTitle: '不同意并退出APP',
                  ),
                )
              ],
            ),
          );
        });
  }

  ///点击事件：同意或不同意隐私政策
  _actionBlock(int actionType) {
    if (0 == actionType) {
      logI('点击了不同意隐私协议');
      _callback!(false);
    } else if (1 == actionType) {
      logI('点击了同意隐私协议');
      _storeShowPrivacyTime();
      _confirmPressed();
    }
  }

  /// 隐私政策同意后进行初始化操作
  _confirmPressed() {
    logI('同意了隐私策略，进行其他初始化操作');
    if (_callback != null) {
      _callback!(true);
    }
  }

  /// 存储显示弹窗规则的时间
  void _storeShowPrivacyTime() async {
    var now = DateTime.now();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('KStoreAgreePrivacy', now.toString());
  }

  /// 判断是否弹框
  /// 1。首次安装的弹窗    弹窗过一次，就不再弹窗
  /// 2。>= 指定的时间    才弹窗`
  Future<bool> isShowPrivacyPolicy() async {
    var agreeDateString = await _get('KStoreAgreePrivacy');
    var configDateString = await _get('KStorePrivacyRuleData');
    if (agreeDateString.isEmpty) {
      return true;
    }
    var currentDate = DateTime.now(); //当前时间
    var agreeDate = DateTime.parse(agreeDateString); //上次同意时间
    var configDate = (configDateString != null && configDateString.isNotEmpty)
        ? DateTime.parse(configDateString)
        : DateTime(2000, 1, 1); //配置时间
    /// 当前时间 要大于配置的时间  同时  配置的时间 要大于上次同意的时间
    if (currentDate.isAfter(configDate) && configDate.isAfter(agreeDate)) {
      return true;
    }
    return false;
  }

  /// 通过key获取value
  Future<String> _get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    return prefs.getString(key) ?? '';
  }
}
