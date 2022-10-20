import 'package:cotticoffee_client/pages/tabs/order/entity/order_detail_model.dart';

class OrderDetailState {
  OrderDetailModel? orderDetail;

  OrderDetailState copy() {
    return OrderDetailState()..orderDetail = orderDetail;
  }

  ///是否是自提
  bool get isSelfTake => orderDetail?.takeType == 0 || orderDetail?.takeType == 1;

  ///是否是外卖
  bool get isTakeOut => orderDetail?.takeType == 2;
}
