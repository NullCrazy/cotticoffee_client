import 'package:cotticoffee_client/generated/json/base/json_field.dart';
import 'package:cotticoffee_client/generated/json/menu_entity.g.dart';
import 'dart:convert';

import 'package:cotticoffee_client/pages/tabs/menu/entity/menu_item_entity.dart';

@JsonSerializable()
class MenuEntity {
  String? id;
  String? code;
  String? name;
  int? sort;
  String? iconUrl;
  String? tagUrl;
  String? classifyDesc;
  List<MenuItemEntity>? items;
  List<MenuEntity>? subList;
  List<MenuEntity>? triList;

  MenuEntity();

  factory MenuEntity.fromJson(Map<String, dynamic> json) => $MenuEntityFromJson(json);

  Map<String, dynamic> toJson() => $MenuEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
