import 'package:cotticoffee_client/routers/home_router.dart';
import 'package:cotticommon/global/global_route_manager.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/8/31 9:32 上午
class MainRouter {
  static init() {
    GlobalRouterManager.registerRoutes(HomeRouter().routes);
  }
}
