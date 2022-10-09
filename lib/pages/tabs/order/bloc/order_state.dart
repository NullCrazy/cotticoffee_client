import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../model/order_cancel_reason_model.dart';
import '../model/order_model.dart';

class OrderState {
  final List<Tab> tabs = [
    Tab("当前订单", 1),
    Tab("历史订单", 2),
  ];
  final int pageSize = 20;

  int pageNo = 1;
  int status = 1;
  bool showLoading = false;
  int? cancelOrderId;
  int requestTimeStamp = 0;
  List<OrderModel> orderList = [];
  int getCancelReasonTimeStamp = 0;
  LoadStatus loadStatus = LoadStatus.idle;
  List<OrderCancelReasonModel> cancelReason = [];
  RefreshStatus refreshStatus = RefreshStatus.idle;

  OrderState copy() {
    return OrderState()
      ..pageNo = pageNo
      ..status = status
      ..orderList = orderList
      ..loadStatus = loadStatus
      ..showLoading = showLoading
      ..cancelReason = cancelReason
      ..refreshStatus = refreshStatus
      ..cancelOrderId = cancelOrderId
      ..requestTimeStamp = requestTimeStamp
      ..getCancelReasonTimeStamp = getCancelReasonTimeStamp;
  }

  OrderState copyReasonTimeStamp(int cancelReasonTimeStamp) {
    return copy()..getCancelReasonTimeStamp = cancelReasonTimeStamp;
  }
}

class Tab {
  String name;
  int status;

  Tab(this.name, this.status);
}
