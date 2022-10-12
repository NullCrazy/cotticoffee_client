import 'package:cotticoffee_client/generated/json/base/json_convert_content.dart';
import 'package:cotticoffee_client/config/entity/config_entity.dart';

ConfigEntity $ConfigEntityFromJson(Map<String, dynamic> json) {
	final ConfigEntity configEntity = ConfigEntity();
	final String? customerServiceHotline = jsonConvert.convert<String>(json['customerServiceHotline']);
	if (customerServiceHotline != null) {
		configEntity.customerServiceHotline = customerServiceHotline;
	}
	final String? customerServiceWorkingTime = jsonConvert.convert<String>(json['customerServiceWorkingTime']);
	if (customerServiceWorkingTime != null) {
		configEntity.customerServiceWorkingTime = customerServiceWorkingTime;
	}
	final String? customerServiceCase = jsonConvert.convert<String>(json['customerServiceCase']);
	if (customerServiceCase != null) {
		configEntity.customerServiceCase = customerServiceCase;
	}
	final String? customerServiceOrderUrl = jsonConvert.convert<String>(json['customerServiceOrderUrl']);
	if (customerServiceOrderUrl != null) {
		configEntity.customerServiceOrderUrl = customerServiceOrderUrl;
	}
	final String? afterTimeAppOpenPopUps = jsonConvert.convert<String>(json['afterTimeAppOpenPopUps']);
	if (afterTimeAppOpenPopUps != null) {
		configEntity.afterTimeAppOpenPopUps = afterTimeAppOpenPopUps;
	}
	final dynamic? h5StyleJsCode = jsonConvert.convert<dynamic>(json['h5StyleJsCode']);
	if (h5StyleJsCode != null) {
		configEntity.h5StyleJsCode = h5StyleJsCode;
	}
	final bool? environment = jsonConvert.convert<bool>(json['environment']);
	if (environment != null) {
		configEntity.environment = environment;
	}
	final dynamic? scanTipText = jsonConvert.convert<dynamic>(json['scanTipText']);
	if (scanTipText != null) {
		configEntity.scanTipText = scanTipText;
	}
	final String? miniProgramSharingSwitch = jsonConvert.convert<String>(json['miniProgramSharingSwitch']);
	if (miniProgramSharingSwitch != null) {
		configEntity.miniProgramSharingSwitch = miniProgramSharingSwitch;
	}
	final String? sharingToWechatMomentsSwitch = jsonConvert.convert<String>(json['sharingToWechatMomentsSwitch']);
	if (sharingToWechatMomentsSwitch != null) {
		configEntity.sharingToWechatMomentsSwitch = sharingToWechatMomentsSwitch;
	}
	final String? specialZoneSharingSwitch = jsonConvert.convert<String>(json['specialZoneSharingSwitch']);
	if (specialZoneSharingSwitch != null) {
		configEntity.specialZoneSharingSwitch = specialZoneSharingSwitch;
	}
	final int? shopMdCode = jsonConvert.convert<int>(json['shopMdCode']);
	if (shopMdCode != null) {
		configEntity.shopMdCode = shopMdCode;
	}
	final int? takeFoodMode = jsonConvert.convert<int>(json['takeFoodMode']);
	if (takeFoodMode != null) {
		configEntity.takeFoodMode = takeFoodMode;
	}
	final bool? exitButtonDisplay = jsonConvert.convert<bool>(json['exitButtonDisplay']);
	if (exitButtonDisplay != null) {
		configEntity.exitButtonDisplay = exitButtonDisplay;
	}
	final bool? showMyBounty = jsonConvert.convert<bool>(json['showMyBounty']);
	if (showMyBounty != null) {
		configEntity.showMyBounty = showMyBounty;
	}
	final List<ConfigServiceModeList>? serviceModeList = jsonConvert.convertListNotNull<ConfigServiceModeList>(json['serviceModeList']);
	if (serviceModeList != null) {
		configEntity.serviceModeList = serviceModeList;
	}
	final String? confirmOrderTakeFoodModeImg = jsonConvert.convert<String>(json['confirmOrderTakeFoodModeImg']);
	if (confirmOrderTakeFoodModeImg != null) {
		configEntity.confirmOrderTakeFoodModeImg = confirmOrderTakeFoodModeImg;
	}
	final int? openingScreenCountdown = jsonConvert.convert<int>(json['openingScreenCountdown']);
	if (openingScreenCountdown != null) {
		configEntity.openingScreenCountdown = openingScreenCountdown;
	}
	final String? orderListEmptyContext = jsonConvert.convert<String>(json['orderListEmptyContext']);
	if (orderListEmptyContext != null) {
		configEntity.orderListEmptyContext = orderListEmptyContext;
	}
	final String? communityWelfareTitle = jsonConvert.convert<String>(json['communityWelfareTitle']);
	if (communityWelfareTitle != null) {
		configEntity.communityWelfareTitle = communityWelfareTitle;
	}
	final int? currentTime = jsonConvert.convert<int>(json['currentTime']);
	if (currentTime != null) {
		configEntity.currentTime = currentTime;
	}
	return configEntity;
}

Map<String, dynamic> $ConfigEntityToJson(ConfigEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['customerServiceHotline'] = entity.customerServiceHotline;
	data['customerServiceWorkingTime'] = entity.customerServiceWorkingTime;
	data['customerServiceCase'] = entity.customerServiceCase;
	data['customerServiceOrderUrl'] = entity.customerServiceOrderUrl;
	data['afterTimeAppOpenPopUps'] = entity.afterTimeAppOpenPopUps;
	data['h5StyleJsCode'] = entity.h5StyleJsCode;
	data['environment'] = entity.environment;
	data['scanTipText'] = entity.scanTipText;
	data['miniProgramSharingSwitch'] = entity.miniProgramSharingSwitch;
	data['sharingToWechatMomentsSwitch'] = entity.sharingToWechatMomentsSwitch;
	data['specialZoneSharingSwitch'] = entity.specialZoneSharingSwitch;
	data['shopMdCode'] = entity.shopMdCode;
	data['takeFoodMode'] = entity.takeFoodMode;
	data['exitButtonDisplay'] = entity.exitButtonDisplay;
	data['showMyBounty'] = entity.showMyBounty;
	data['serviceModeList'] =  entity.serviceModeList?.map((v) => v.toJson()).toList();
	data['confirmOrderTakeFoodModeImg'] = entity.confirmOrderTakeFoodModeImg;
	data['openingScreenCountdown'] = entity.openingScreenCountdown;
	data['orderListEmptyContext'] = entity.orderListEmptyContext;
	data['communityWelfareTitle'] = entity.communityWelfareTitle;
	data['currentTime'] = entity.currentTime;
	return data;
}

ConfigServiceModeList $ConfigServiceModeListFromJson(Map<String, dynamic> json) {
	final ConfigServiceModeList configServiceModeList = ConfigServiceModeList();
	final int? index = jsonConvert.convert<int>(json['index']);
	if (index != null) {
		configServiceModeList.index = index;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		configServiceModeList.name = name;
	}
	return configServiceModeList;
}

Map<String, dynamic> $ConfigServiceModeListToJson(ConfigServiceModeList entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['index'] = entity.index;
	data['name'] = entity.name;
	return data;
}