import 'package:cotticoffee_client/generated/json/base/json_field.dart';
import 'package:cotticoffee_client/generated/json/pay_type_list_model.g.dart';

@JsonSerializable()
class PayTypeListModel {
  PayTypeListModel();

  factory PayTypeListModel.fromJson(Map<String, dynamic> json) => $PayTypeListModelFromJson(json);

  Map<String, dynamic> toJson() => $PayTypeListModelToJson(this);

  String? applicationNo;
  List<PayTypeModel>? payTypeList;
}

@JsonSerializable()
class PayTypeModel {
  PayTypeModel();

  factory PayTypeModel.fromJson(Map<String, dynamic> json) => $PayTypeModelFromJson(json);

  Map<String, dynamic> toJson() => $PayTypeModelToJson(this);

  String? payType;
  String? showIcon;
  String? showName;
  int? status;
}
