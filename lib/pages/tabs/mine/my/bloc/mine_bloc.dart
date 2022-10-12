import 'package:bloc/bloc.dart';
import 'package:cotticoffee_client/pages/tabs/mine/my/api/mine_api.dart';

import 'mine_event.dart';
import 'mine_state.dart';

class MineBloc extends Bloc<MineEvent, MineState> {
  MineBloc() : super(MineState()) {
    on<GetUserInfoEvent>(_getUserInfo);
  }

  _getUserInfo(_, emit) async {
    state.userInfoEntity = await MineApi.getPersonalInfo();
    emit(state.copy());
  }
}
