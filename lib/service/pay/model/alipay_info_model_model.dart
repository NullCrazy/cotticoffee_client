import 'package:cotticoffee_client/generated/json/alipay_info_model_model.g.dart';
import 'package:cotticoffee_client/generated/json/base/json_field.dart';

import 'alipay_info_model_pay_info.dart';

@JsonSerializable()
class AlipayInfoModelModel {
  AlipayInfoModelModel();

  factory AlipayInfoModelModel.fromJson(Map<String, dynamic> json) =>
      $AlipayInfoModelModelFromJson(json);

  Map<String, dynamic> toJson() => $AlipayInfoModelModelToJson(this);

  AlipayInfoModelPayInfo? payInfo;
  String? recordNo;
  String? status;
}
