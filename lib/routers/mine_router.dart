import 'package:cotticoffee_client/pages/tabs/mine/setting/about_page.dart';
import 'package:cotticoffee_client/pages/tabs/mine/setting/setting_page.dart';
import 'package:cotticoffee_client/pages/tabs/mine/setting/shop_license_page.dart';
import 'package:cotticommon/cotticommon.dart';
import 'package:fluro/fluro.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/12 7:18 PM
class MineRouter extends ModuleRouteManager {
  static const String settingPage = '/pages/tabs/mine/setting';
  static const String aboutPage = '/pages/tabs/mine/setting/aboutPage';
  static const String shopLicensePage = '/pages/tabs/mine/setting/shopLicensePage';

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
          shopLicensePage,
          handler: Handler(handlerFunc: (context, params) {
            return const ShopLicensePage();
          }),
        ),
      ];
}
