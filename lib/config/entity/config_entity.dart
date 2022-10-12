import 'package:cotticoffee_client/generated/json/base/json_field.dart';
import 'package:cotticoffee_client/generated/json/config_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ConfigEntity {

	String? customerServiceHotline;
	String? customerServiceWorkingTime;
	String? customerServiceCase;
	String? customerServiceOrderUrl;
	String? afterTimeAppOpenPopUps;
	dynamic h5StyleJsCode;
	bool? environment;
	dynamic scanTipText;
	String? miniProgramSharingSwitch;
	String? sharingToWechatMomentsSwitch;
	String? specialZoneSharingSwitch;
	int? shopMdCode;
	int? takeFoodMode;
	bool? exitButtonDisplay;
	bool? showMyBounty;
	List<ConfigServiceModeList>? serviceModeList;
	String? confirmOrderTakeFoodModeImg;
	int? openingScreenCountdown;
	String? orderListEmptyContext;
	String? communityWelfareTitle;
	int? currentTime;
  
  ConfigEntity();

  factory ConfigEntity.fromJson(Map<String, dynamic> json) => $ConfigEntityFromJson(json);

  Map<String, dynamic> toJson() => $ConfigEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ConfigServiceModeList {

	int? index;
	String? name;
  
  ConfigServiceModeList();

  factory ConfigServiceModeList.fromJson(Map<String, dynamic> json) => $ConfigServiceModeListFromJson(json);

  Map<String, dynamic> toJson() => $ConfigServiceModeListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}