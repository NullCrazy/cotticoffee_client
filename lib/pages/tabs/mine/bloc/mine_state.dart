import 'package:cotticoffee_client/pages/tabs/mine/entity/user_info_entity.dart';

class MineState {
  UserInfoEntity? userInfoEntity;

  MineState copy() {
    MineState newState = MineState()..userInfoEntity = userInfoEntity;
    return newState;
  }
}
