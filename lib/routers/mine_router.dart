import 'package:cotticoffee_client/pages/tabs/mine/setting/about_page.dart';
import 'package:cotticoffee_client/pages/tabs/mine/setting/account_security_page.dart';
import 'package:cotticoffee_client/pages/tabs/mine/setting/license_page.dart';
import 'package:cotticoffee_client/pages/tabs/mine/setting/setting_page.dart';
import 'package:cotticoffee_client/pages/tabs/mine/setting/shop_license_detail_page.dart';
import 'package:cotticoffee_client/pages/tabs/mine/setting/shop_license_page.dart';
import 'package:cotticommon/cotticommon.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/12 7:18 PM
class MineRouter extends ModuleRouteManager {
  static const String settingPage = '/pages/tabs/mine/setting';
  static const String aboutPage = '/pages/tabs/mine/setting/aboutPage';
  static const String licensePage = '/pages/tabs/mine/setting/licensePage';
  static const String shopLicensePage = '/pages/tabs/mine/setting/shopLicensePage';
  static const String shopLicenseDetailPage = '/pages/tabs/mine/setting/shopLicenseDetailPage';
  static const String accountSecurityPage = '/pages/tabs/mine/setting/accountSecurityPage';

  @override
  List<RouteEntry> get routes => [
        RouteEntry(
          settingPage,
          handler: Handler(handlerFunc: (context, params) {
            return const SettingPage();
          }),
        ),
        RouteEntry(
          aboutPage,
          handler: Handler(handlerFunc: (context, params) {
            return const AboutPage();
          }),
        ),
        RouteEntry(
          licensePage,
          handler: Handler(handlerFunc: (context, params) {
            return const LicensePage();
          }),
        ),
        RouteEntry(
          shopLicensePage,
          handler: Handler(handlerFunc: (context, params) {
            return const ShopLicensePage();
          }),
        ),
        RouteEntry(
          shopLicenseDetailPage,
          handler: Handler(handlerFunc: (BuildContext? context, _) {
            Object? obj = context?.settings?.arguments;
            List<String> images = [];
            if (obj != null) {
              images = obj as List<String>;
            }
            return ShopLicenseDetailPage(images: images);
          }),
        ),
        RouteEntry(
          accountSecurityPage,
          handler: Handler(handlerFunc: (_, __) {
            return const AccountSecurityPage();
          }),
        ),
      ];
}
