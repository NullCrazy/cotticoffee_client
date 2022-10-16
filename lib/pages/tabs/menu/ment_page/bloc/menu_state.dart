import 'package:cotticoffee_client/pages/tabs/menu/entity/menu_head.dart';

class MenuState {
  List<MenuHead> menuHeads = [];

  MenuState copy() {
    return MenuState()..menuHeads = menuHeads;
  }
}
