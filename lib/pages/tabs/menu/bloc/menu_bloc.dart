import 'package:bloc/bloc.dart';

import 'menu_event.dart';
import 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuState()) {
    on<MenuEvent>((event, emit) {});
  }
}
