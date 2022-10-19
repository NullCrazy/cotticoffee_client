import 'package:cotticoffee_client/network/cotti_net_work.dart';
import 'package:cotticoffee_client/pages/tabs/order/entity/order_cancel_reason_model.dart';
import 'package:cotticoffee_client/pages/tabs/order/entity/order_detail_model.dart';
import 'package:cotticoffee_client/pages/tabs/order/entity/order_model.dart';
import 'package:cotticoffee_client/pages/tabs/order/entity/order_refund_model.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/9 3:03 PM
class OrderApi {
  static const orderList = "/order/getOrderList";
  static const cancelTrade = "/order/cancelTrade";
  static const _cancelOrder = "/order/cancelOrder";
  static const _orderRefund = "/order/getOrderRefundList";
  static const _getCancelReasonList = "/order/getCancelReasonList";
  static const _getOrderDetail = "/order/getOrderDetail";

  static Future<List<OrderModel>> getOrderList(int status, int page, int pageSize) {
    return CottiNetWork().post(
      orderList,
      data: {"appTabStatus": status, "pageNo": page, "pageSize": pageSize},
    ).then((value) => OrderModels.fromJson(value).orders ?? []);
  }

  ///
  /// orderCancelType 枚举如下，写死1
  ///        USER(1, "用户"),
  ///         SHOP(2, "门店"),
  ///         ADMIN(3, "客服"),
  ///         SYSTEM(4, "系统"),
  ///         CHANNEL(5, "渠道");
  static Future<bool> cancelOrderRequest(
      int? orderId, int? orderCancelReasonId, String? otherReasons) {
    return CottiNetWork().post(_cancelOrder, data: {
      "orderId": orderId,
      "orderCancelType": 1,
      "orderCancelReasonId": orderCancelReasonId,
      "otherReasons": otherReasons,
    }).then((value) {
      if (value != null) {
        return value as bool;
      } else {
        return false;
      }
    });
  }

  static Future<List<OrderRefundModel>> getOrderRefund(String memberId, String orderId) {
    return CottiNetWork()
        .post(_orderRefund, data: {"memberId": memberId, "orderId": orderId}).then((value) {
      List listObj = value ?? [];
      return listObj.map((e) => OrderRefundModel.fromJson(e)).toList();
    });
  }

  static Future<List<OrderCancelReasonModel>> getCancelReasonList(
      int orderCancelType, int adapterOrderOrigin) {
    return CottiNetWork().post(_getCancelReasonList, data: {
      "orderCancelType": orderCancelType,
      "adapterOrderOrigin": adapterOrderOrigin
    }).then((value) {
      return CancelReasonList.fromJson(value).orderCancelReasonModels ?? [];
    });
  }

  static Future<OrderDetailModel> getOrderDetail(String orderId) {
    return CottiNetWork().post(_getOrderDetail,
        data: {'orderId': orderId}).then((value) => OrderDetailModel.fromJson(value));
  }
}
