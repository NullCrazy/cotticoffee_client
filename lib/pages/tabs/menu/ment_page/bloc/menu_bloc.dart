import 'package:bloc/bloc.dart';
import 'package:cotticoffee_client/pages/tabs/menu/menu_api.dart';

import 'menu_event.dart';
import 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuState()) {
    on<MenuListEvent>(_menuList);
  }

  _menuList(MenuListEvent event, emit) async {
    state.subList = await MenuApi.getMenu(event.takeFoodMode, event.shopMdCode);
    emit(state.copy());
  }
}
