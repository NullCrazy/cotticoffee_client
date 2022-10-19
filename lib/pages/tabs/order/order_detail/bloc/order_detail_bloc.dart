import 'package:bloc/bloc.dart';
import 'package:cotticoffee_client/pages/tabs/order/api/orderApi.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_detail/bloc/order_detail_event.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_detail/bloc/order_detail_state.dart';
import 'package:cotticommon/cotticommon.dart';

class OrderDetailBloc extends Bloc<OrderDetailEvent, OrderDetailState> {
  OrderDetailBloc() : super(OrderDetailState()) {
    on<OrderInfoEvent>(_orderInfo);
  }

  _orderInfo(OrderInfoEvent event, emit) async {
    state.orderDetail = await OrderApi.getOrderDetail(event.orderId)
        .catchError((onError) => logI('获取订单详情失败${event.orderId}'));
    emit(state.copy());
  }
}
