import 'package:cotticoffee_client/generated/json/base/json_convert_content.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/special_activity_limit.dart';

SpecialActivityLimit $SpecialActivityLimitFromJson(Map<String, dynamic> json) {
	final SpecialActivityLimit specialActivityLimit = SpecialActivityLimit();
	final int? activityStatus = jsonConvert.convert<int>(json['activityStatus']);
	if (activityStatus != null) {
		specialActivityLimit.activityStatus = activityStatus;
	}
	final int? limitAmount = jsonConvert.convert<int>(json['limitAmount']);
	if (limitAmount != null) {
		specialActivityLimit.limitAmount = limitAmount;
	}
	final int? activityShowType = jsonConvert.convert<int>(json['activityShowType']);
	if (activityShowType != null) {
		specialActivityLimit.activityShowType = activityShowType;
	}
	final int? specialShowCountdown = jsonConvert.convert<int>(json['specialShowCountdown']);
	if (specialShowCountdown != null) {
		specialActivityLimit.specialShowCountdown = specialShowCountdown;
	}
	return specialActivityLimit;
}

Map<String, dynamic> $SpecialActivityLimitToJson(SpecialActivityLimit entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['activityStatus'] = entity.activityStatus;
	data['limitAmount'] = entity.limitAmount;
	data['activityShowType'] = entity.activityShowType;
	data['specialShowCountdown'] = entity.specialShowCountdown;
	return data;
}