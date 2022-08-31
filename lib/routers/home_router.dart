import 'package:cotticoffee_client/pages/home/home_page.dart';
import 'package:cotticommon/router/module_route_manager.dart';
import 'package:cotticommon/router/route_entry.dart';
import 'package:fluro/fluro.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/8/31 9:39 上午
class HomeRouter extends ModuleRouteManager {
  static const String homePage = '/pages/home/home_page';

  @override
  List<RouteEntry> get routes => [
        RouteEntry(
          homePage,
          handler: Handler(handlerFunc: (context, params) {
            return const HomePage();
          }),
        ),
      ];
}
