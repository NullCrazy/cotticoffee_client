import 'package:cotticoffee_client/pages/tabs/menu/entity/menu_entity.dart';

class MenuState {
  List<MenuEntity> subList = [];

  MenuState copy() {
    return MenuState()..subList = subList;
  }
}
