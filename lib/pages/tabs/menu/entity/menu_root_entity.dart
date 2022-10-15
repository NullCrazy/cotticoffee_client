import 'package:cotticoffee_client/generated/json/base/json_field.dart';
import 'package:cotticoffee_client/generated/json/menu_root_entity.g.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/menu_entity.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/14 3:06 PM

@JsonSerializable()
class MenuRootEntity {
  List<MenuEntity>? rootList;
  int? positionForCarousell;
  num? nowTime;

  MenuRootEntity();

  factory MenuRootEntity.fromJson(Map<String, dynamic> json) => $MenuRootEntityFromJson(json);

  Map<String, dynamic> toJson() => $MenuRootEntityToJson(this);
}
