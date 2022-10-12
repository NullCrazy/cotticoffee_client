import 'package:cotticoffee_client/network/cotti_net_work.dart';
import 'package:cotticoffee_client/pages/tabs/mine/entity/user_info_entity.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/11 2:44 PM
class MineApi {
  static const _getPersonalInfo = "/person/getPersonalInfo";

  static Future<UserInfoEntity> getPersonalInfo() {
    return CottiNetWork().post(_getPersonalInfo).then((value) => UserInfoEntity.fromJson(value));
  }
}
