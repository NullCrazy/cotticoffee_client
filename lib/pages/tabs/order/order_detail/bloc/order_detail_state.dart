import 'package:cotticoffee_client/pages/tabs/order/entity/order_detail_model.dart';

class OrderDetailState {
  OrderDetailModel? orderDetail;

  OrderDetailState copy() {
    return OrderDetailState()..orderDetail = orderDetail;
  }
}
