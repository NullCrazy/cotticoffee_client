import 'package:cotticoffee_client/generated/json/base/json_convert_content.dart';
import 'package:cotticoffee_client/service/pay/model/pay_type_list_model.dart';

PayTypeListModel $PayTypeListModelFromJson(Map<String, dynamic> json) {
	final PayTypeListModel payTypeListModel = PayTypeListModel();
	final String? applicationNo = jsonConvert.convert<String>(json['applicationNo']);
	if (applicationNo != null) {
		payTypeListModel.applicationNo = applicationNo;
	}
	final List<PayTypeModel>? payTypeList = jsonConvert.convertListNotNull<PayTypeModel>(json['payTypeList']);
	if (payTypeList != null) {
		payTypeListModel.payTypeList = payTypeList;
	}
	return payTypeListModel;
}

Map<String, dynamic> $PayTypeListModelToJson(PayTypeListModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['applicationNo'] = entity.applicationNo;
	data['payTypeList'] =  entity.payTypeList?.map((v) => v.toJson()).toList();
	return data;
}

PayTypeModel $PayTypeModelFromJson(Map<String, dynamic> json) {
	final PayTypeModel payTypeModel = PayTypeModel();
	final String? payType = jsonConvert.convert<String>(json['payType']);
	if (payType != null) {
		payTypeModel.payType = payType;
	}
	final String? showIcon = jsonConvert.convert<String>(json['showIcon']);
	if (showIcon != null) {
		payTypeModel.showIcon = showIcon;
	}
	final String? showName = jsonConvert.convert<String>(json['showName']);
	if (showName != null) {
		payTypeModel.showName = showName;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		payTypeModel.status = status;
	}
	return payTypeModel;
}

Map<String, dynamic> $PayTypeModelToJson(PayTypeModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['payType'] = entity.payType;
	data['showIcon'] = entity.showIcon;
	data['showName'] = entity.showName;
	data['status'] = entity.status;
	return data;
}