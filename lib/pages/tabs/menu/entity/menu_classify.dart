import 'dart:convert';

import 'package:cotticoffee_client/generated/json/base/json_field.dart';
import 'package:cotticoffee_client/generated/json/menu_classify.g.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/base_menu.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/menu_item_entity.dart';

@JsonSerializable()
class MenuClassify extends BaseMenu {
  String? id;
  String? code;
  String? name;
  int? sort;
  String? iconUrl;
  String? tagUrl;
  String? classifyDesc;
  List<MenuItemEntity>? items;
  List<MenuClassify>? subList;
  List<MenuClassify>? triList;
  int? tag;

  MenuClassify();

  factory MenuClassify.fromJson(Map<String, dynamic> json) => $MenuClassifyFromJson(json);

  Map<String, dynamic> toJson() => $MenuClassifyToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
