import 'dart:async';
import 'dart:convert' as convert;

import 'package:cotticoffee_client/network/cotti_net_work.dart';
import 'package:cotticoffee_client/service/pay/model/alipay_info_model_model.dart';
import 'package:cotticommon/cotticommon.dart';

import 'model/pay_type_list_model.dart';
import 'model/wechat_pay_info_model.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/3/14 9:15 下午
class PayApi {
  static const String orderConformPayTypeListUrl = "/customer/pay/type/list";

  /// 获取微信支付信息
  static const String weChatPayInfoUrl = "/customer/pay/wxpay/app";

  /// 获取支付宝支付信息
  static const String aLiPayInfoUrl = "/customer/pay/alipay/app";

  static const String _keyCachePayType = "KEY_CACHE_PAY_TYPE";

  static Future<PayTypeListModel> getPayList() {
    Completer<PayTypeListModel> completer = Completer();
    String cachePayType = SpUtil.getString(_keyCachePayType);
    CottiNetWork().post(orderConformPayTypeListUrl, data: {}).then((value) {
      SpUtil.putString(_keyCachePayType, convert.jsonEncode(value.data));
      if (cachePayType.isEmpty) {
        completer.complete(PayTypeListModel.fromJson(value.data));
      }
    }).catchError((onError) {
      if (cachePayType.isEmpty) {
        completer.completeError(onError);
      }
    });
    if (cachePayType.isNotEmpty) {
      completer.complete(PayTypeListModel.fromJson(convert.jsonDecode(cachePayType)));
    }
    return completer.future;
  }

  static Future<WechatPayInfoModel> wechatPayInfo(Map<String, dynamic> params) {
    return CottiNetWork()
        .post(weChatPayInfoUrl, data: params)
        .then((value) => WechatPayInfoModel.fromJson(value.data));
  }

  static Future<AlipayInfoModelModel> alipayInfo(Map<String, dynamic> params) {
    return CottiNetWork()
        .post(aLiPayInfoUrl, data: params)
        .then((value) => AlipayInfoModelModel.fromJson(value.data));
  }
}
