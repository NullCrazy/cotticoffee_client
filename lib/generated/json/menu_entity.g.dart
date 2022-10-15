import 'package:cotticoffee_client/generated/json/base/json_convert_content.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/menu_entity.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/menu_item_entity.dart';


MenuEntity $MenuEntityFromJson(Map<String, dynamic> json) {
	final MenuEntity menuEntity = MenuEntity();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		menuEntity.id = id;
	}
	final String? code = jsonConvert.convert<String>(json['code']);
	if (code != null) {
		menuEntity.code = code;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		menuEntity.name = name;
	}
	final int? sort = jsonConvert.convert<int>(json['sort']);
	if (sort != null) {
		menuEntity.sort = sort;
	}
	final String? iconUrl = jsonConvert.convert<String>(json['iconUrl']);
	if (iconUrl != null) {
		menuEntity.iconUrl = iconUrl;
	}
	final String? tagUrl = jsonConvert.convert<String>(json['tagUrl']);
	if (tagUrl != null) {
		menuEntity.tagUrl = tagUrl;
	}
	final String? classifyDesc = jsonConvert.convert<String>(json['classifyDesc']);
	if (classifyDesc != null) {
		menuEntity.classifyDesc = classifyDesc;
	}
	final List<MenuItemEntity>? items = jsonConvert.convertListNotNull<MenuItemEntity>(json['items']);
	if (items != null) {
		menuEntity.items = items;
	}
	final List<MenuEntity>? subList = jsonConvert.convertListNotNull<MenuEntity>(json['subList']);
	if (subList != null) {
		menuEntity.subList = subList;
	}
	final List<MenuEntity>? triList = jsonConvert.convertListNotNull<MenuEntity>(json['triList']);
	if (triList != null) {
		menuEntity.triList = triList;
	}
	return menuEntity;
}

Map<String, dynamic> $MenuEntityToJson(MenuEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['code'] = entity.code;
	data['name'] = entity.name;
	data['sort'] = entity.sort;
	data['iconUrl'] = entity.iconUrl;
	data['tagUrl'] = entity.tagUrl;
	data['classifyDesc'] = entity.classifyDesc;
	data['items'] =  entity.items?.map((v) => v.toJson()).toList();
	data['subList'] =  entity.subList?.map((v) => v.toJson()).toList();
	data['triList'] =  entity.triList?.map((v) => v.toJson()).toList();
	return data;
}