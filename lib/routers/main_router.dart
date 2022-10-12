import 'package:cotticoffee_client/routers/mine_router.dart';
import 'package:cotticoffee_client/routers/order_router.dart';
import 'package:cotticoffee_client/routers/web_view_router.dart';
import 'package:cotticommon/global/global_route_manager.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/8/31 9:32 上午
class MainRouter {
  static init() {
    GlobalRouterManager.registerRoutes(OrderRouter().routes);
    GlobalRouterManager.registerRoutes(MineRouter().routes);
    GlobalRouterManager.registerRoutes(WebViewRouter().routes);
  }
}
