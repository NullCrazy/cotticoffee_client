import 'package:cotticoffee_client/network/cotti_net_work.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/menu_entity.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/menu_root_entity.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/15 9:51 AM
class MenuApi {
  static const String _menu = '/item/menu';

  static Future<List<MenuEntity>> getMenu(int takeFoodMode, String shopMdCode) {
    return CottiNetWork().post(_menu, data: {
      'takeFoodMode': takeFoodMode,
      'shopMdCode': shopMdCode
    }).then((value) => MenuRootEntity.fromJson(value).rootList ?? []);
  }
}
