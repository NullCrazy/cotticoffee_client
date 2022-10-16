import 'package:cotticoffee_client/pages/tabs/menu/entity/base_menu.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/menu_classify.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/16 7:45 PM
class MenuHead {
  late int key;
  late MenuClassify firstHead;
  List<BaseMenu> items = [];

  MenuHead(this.key, this.firstHead);
}
