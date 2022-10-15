import 'package:cotticoffee_client/generated/json/base/json_field.dart';
import 'package:cotticoffee_client/generated/json/coupon_bounty_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class CouponBountyEntity {

	CouponBountyCouponMsg? couponMsg;
	CouponBountyBountyMsg? bountyMsg;
  
  CouponBountyEntity();

  factory CouponBountyEntity.fromJson(Map<String, dynamic> json) => $CouponBountyEntityFromJson(json);

  Map<String, dynamic> toJson() => $CouponBountyEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CouponBountyCouponMsg {

	int? totalCouponAmount;
	int? expiringSoonCouponAmount;
  
  CouponBountyCouponMsg();

  factory CouponBountyCouponMsg.fromJson(Map<String, dynamic> json) => $CouponBountyCouponMsgFromJson(json);

  Map<String, dynamic> toJson() => $CouponBountyCouponMsgToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CouponBountyBountyMsg {

	int? bounty;
	bool? display;
  
  CouponBountyBountyMsg();

  factory CouponBountyBountyMsg.fromJson(Map<String, dynamic> json) => $CouponBountyBountyMsgFromJson(json);

  Map<String, dynamic> toJson() => $CouponBountyBountyMsgToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}