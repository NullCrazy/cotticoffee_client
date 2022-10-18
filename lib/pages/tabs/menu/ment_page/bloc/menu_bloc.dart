import 'package:bloc/bloc.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/menu_classify.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/menu_head.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/menu_item_entity.dart';
import 'package:cotticoffee_client/pages/tabs/menu/menu_api.dart';

import 'menu_event.dart';
import 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuState()) {
    on<MenuListEvent>(_menuList);
  }

  _menuList(MenuListEvent event, emit) async {
    List<MenuClassify> menus = await MenuApi.getMenu(event.takeFoodMode, event.shopMdCode);
    int index = -1;
    List<MenuHead> menuHeads = [];
    for (var element in menus) {
      for (MenuClassify subItem in (element.subList ?? [])) {
        index++;
        MenuHead firstHead = MenuHead(index, subItem);
        for (MenuClassify triItem in (subItem.triList ?? [])) {
          index++;
          triItem.key = index;
          firstHead.items.add(triItem);
          for (MenuItemEntity itemEntity in (triItem.items ?? [])) {
            index++;
            itemEntity.key = index;
            firstHead.items.add(itemEntity);
          }
        }
        for (MenuItemEntity itemEntity in (subItem.items ?? [])) {
          index++;
          itemEntity.key = index;
          firstHead.items.add(itemEntity);
        }
        menuHeads.add(firstHead);
      }
    }
    state.menuHeads = menuHeads;
    emit(state.copy());
  }
}
