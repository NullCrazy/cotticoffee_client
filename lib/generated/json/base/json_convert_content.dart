// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:cotticoffee_client/pages/tabs/mine/my/entity/user_info_entity.dart';
import 'package:cotticoffee_client/pages/tabs/order/model/order_cancel_reason_model.dart';
import 'package:cotticoffee_client/pages/tabs/order/model/order_detail_model.dart';
import 'package:cotticoffee_client/pages/tabs/order/model/order_express.dart';
import 'package:cotticoffee_client/pages/tabs/order/model/order_model.dart';
import 'package:cotticoffee_client/pages/tabs/order/model/order_refund_model.dart';
import 'package:cotticoffee_client/pages/tabs/order/model/order_url_model.dart';
import 'package:cotticoffee_client/service/pay/model/alipay_info_model_model.dart';
import 'package:cotticoffee_client/service/pay/model/alipay_info_model_pay_info.dart';
import 'package:cotticoffee_client/service/pay/model/pay_type_list_model.dart';
import 'package:cotticoffee_client/service/pay/model/wechat_pay_info_model.dart';

JsonConvert jsonConvert = JsonConvert();
typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);

class JsonConvert {
	static final Map<String, JsonConvertFunction> _convertFuncMap = {
		(UserInfoEntity).toString(): UserInfoEntity.fromJson,
		(CancelReasonList).toString(): CancelReasonList.fromJson,
		(OrderCancelReasonModel).toString(): OrderCancelReasonModel.fromJson,
		(OrderDetailModel).toString(): OrderDetailModel.fromJson,
		(OrderQueryFinance).toString(): OrderQueryFinance.fromJson,
		(OrderQueryExtend).toString(): OrderQueryExtend.fromJson,
		(OrderQueryPay).toString(): OrderQueryPay.fromJson,
		(OrderQueryCancel).toString(): OrderQueryCancel.fromJson,
		(OrderQueryProduct).toString(): OrderQueryProduct.fromJson,
		(OrderExpress).toString(): OrderExpress.fromJson,
		(DispatchInfo).toString(): DispatchInfo.fromJson,
		(ExpressInfo).toString(): ExpressInfo.fromJson,
		(OrderModels).toString(): OrderModels.fromJson,
		(OrderModel).toString(): OrderModel.fromJson,
		(ProductModel).toString(): ProductModel.fromJson,
		(OrderRefundModel).toString(): OrderRefundModel.fromJson,
		(OrderRefundProductList).toString(): OrderRefundProductList.fromJson,
		(OrderUrlModel).toString(): OrderUrlModel.fromJson,
		(OrderUrlData).toString(): OrderUrlData.fromJson,
		(AlipayInfoModelModel).toString(): AlipayInfoModelModel.fromJson,
		(AlipayInfoModelPayInfo).toString(): AlipayInfoModelPayInfo.fromJson,
		(PayTypeListModel).toString(): PayTypeListModel.fromJson,
		(PayTypeModel).toString(): PayTypeModel.fromJson,
		(WechatPayInfoModel).toString(): WechatPayInfoModel.fromJson,
		(WechatPayInfoPayInfo).toString(): WechatPayInfoPayInfo.fromJson,
	};

  T? convert<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return asT<T>(value);
  }

  List<T?>? convertList<T>(List<dynamic>? value) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => asT<T>(e)).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => asT<T>(e)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? asT<T extends Object?>(dynamic value) {
    if (value is T) {
      return value;
    }
    final String type = T.toString();
    try {
      final String valueS = value.toString();
      if (type == "String") {
        return valueS as T;
      } else if (type == "int") {
        final int? intValue = int.tryParse(valueS);
        if (intValue == null) {
          return double.tryParse(valueS)?.toInt() as T?;
        } else {
          return intValue as T;
        }
      } else if (type == "double") {
        return double.parse(valueS) as T;
      } else if (type == "DateTime") {
        return DateTime.parse(valueS) as T;
      } else if (type == "bool") {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else if (type == "Map" || type.startsWith("Map<")) {
        return value as T;
      } else {
        if (_convertFuncMap.containsKey(type)) {
          return _convertFuncMap[type]!(value) as T;
        } else {
          throw UnimplementedError('$type unimplemented');
        }
      }
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return null;
    }
  }

	//list is returned by type
	static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
		if(<UserInfoEntity>[] is M){
			return data.map<UserInfoEntity>((Map<String, dynamic> e) => UserInfoEntity.fromJson(e)).toList() as M;
		}
		if(<CancelReasonList>[] is M){
			return data.map<CancelReasonList>((Map<String, dynamic> e) => CancelReasonList.fromJson(e)).toList() as M;
		}
		if(<OrderCancelReasonModel>[] is M){
			return data.map<OrderCancelReasonModel>((Map<String, dynamic> e) => OrderCancelReasonModel.fromJson(e)).toList() as M;
		}
		if(<OrderDetailModel>[] is M){
			return data.map<OrderDetailModel>((Map<String, dynamic> e) => OrderDetailModel.fromJson(e)).toList() as M;
		}
		if(<OrderQueryFinance>[] is M){
			return data.map<OrderQueryFinance>((Map<String, dynamic> e) => OrderQueryFinance.fromJson(e)).toList() as M;
		}
		if(<OrderQueryExtend>[] is M){
			return data.map<OrderQueryExtend>((Map<String, dynamic> e) => OrderQueryExtend.fromJson(e)).toList() as M;
		}
		if(<OrderQueryPay>[] is M){
			return data.map<OrderQueryPay>((Map<String, dynamic> e) => OrderQueryPay.fromJson(e)).toList() as M;
		}
		if(<OrderQueryCancel>[] is M){
			return data.map<OrderQueryCancel>((Map<String, dynamic> e) => OrderQueryCancel.fromJson(e)).toList() as M;
		}
		if(<OrderQueryProduct>[] is M){
			return data.map<OrderQueryProduct>((Map<String, dynamic> e) => OrderQueryProduct.fromJson(e)).toList() as M;
		}
		if(<OrderExpress>[] is M){
			return data.map<OrderExpress>((Map<String, dynamic> e) => OrderExpress.fromJson(e)).toList() as M;
		}
		if(<DispatchInfo>[] is M){
			return data.map<DispatchInfo>((Map<String, dynamic> e) => DispatchInfo.fromJson(e)).toList() as M;
		}
		if(<ExpressInfo>[] is M){
			return data.map<ExpressInfo>((Map<String, dynamic> e) => ExpressInfo.fromJson(e)).toList() as M;
		}
		if(<OrderModels>[] is M){
			return data.map<OrderModels>((Map<String, dynamic> e) => OrderModels.fromJson(e)).toList() as M;
		}
		if(<OrderModel>[] is M){
			return data.map<OrderModel>((Map<String, dynamic> e) => OrderModel.fromJson(e)).toList() as M;
		}
		if(<ProductModel>[] is M){
			return data.map<ProductModel>((Map<String, dynamic> e) => ProductModel.fromJson(e)).toList() as M;
		}
		if(<OrderRefundModel>[] is M){
			return data.map<OrderRefundModel>((Map<String, dynamic> e) => OrderRefundModel.fromJson(e)).toList() as M;
		}
		if(<OrderRefundProductList>[] is M){
			return data.map<OrderRefundProductList>((Map<String, dynamic> e) => OrderRefundProductList.fromJson(e)).toList() as M;
		}
		if(<OrderUrlModel>[] is M){
			return data.map<OrderUrlModel>((Map<String, dynamic> e) => OrderUrlModel.fromJson(e)).toList() as M;
		}
		if(<OrderUrlData>[] is M){
			return data.map<OrderUrlData>((Map<String, dynamic> e) => OrderUrlData.fromJson(e)).toList() as M;
		}
		if(<AlipayInfoModelModel>[] is M){
			return data.map<AlipayInfoModelModel>((Map<String, dynamic> e) => AlipayInfoModelModel.fromJson(e)).toList() as M;
		}
		if(<AlipayInfoModelPayInfo>[] is M){
			return data.map<AlipayInfoModelPayInfo>((Map<String, dynamic> e) => AlipayInfoModelPayInfo.fromJson(e)).toList() as M;
		}
		if(<PayTypeListModel>[] is M){
			return data.map<PayTypeListModel>((Map<String, dynamic> e) => PayTypeListModel.fromJson(e)).toList() as M;
		}
		if(<PayTypeModel>[] is M){
			return data.map<PayTypeModel>((Map<String, dynamic> e) => PayTypeModel.fromJson(e)).toList() as M;
		}
		if(<WechatPayInfoModel>[] is M){
			return data.map<WechatPayInfoModel>((Map<String, dynamic> e) => WechatPayInfoModel.fromJson(e)).toList() as M;
		}
		if(<WechatPayInfoPayInfo>[] is M){
			return data.map<WechatPayInfoPayInfo>((Map<String, dynamic> e) => WechatPayInfoPayInfo.fromJson(e)).toList() as M;
		}

		debugPrint("${M.toString()} not found");
	
		return null;
}

	static M? fromJsonAsT<M>(dynamic json) {
		if (json is List) {
			return _getListChildType<M>(json.map((e) => e as Map<String, dynamic>).toList());
		} else {
			return jsonConvert.asT<M>(json);
		}
	}
}