import 'package:cotticoffee_client/pages/tabs/mine/my/entity/coupon_bounty_entity.dart';
import 'package:cotticoffee_client/pages/tabs/mine/my/entity/user_info_entity.dart';

class MineState {
  UserInfoEntity? userInfoEntity;
  CouponBountyEntity? couponBountyEntity;

  MineState copy() {
    MineState newState = MineState()
      ..userInfoEntity = userInfoEntity
      ..couponBountyEntity = couponBountyEntity;
    return newState;
  }
}
