import 'package:bloc/bloc.dart';
import 'package:cotticoffee_client/pages/tabs/order/api/orderApi.dart';
import 'package:cotticommon/cotticommon.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'order_event.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderState()) {
    on<SwitchOrderStatusEvent>(_switchOrderStatus);
    on<OnLoadingEvent>(_onLoading);
    on<OnRefreshEvent>(_onRefresh);
    on<CancelReasonListEvent>(_cancelReasonList);
    on<CancelOrderEvent>(_cancelOrder);
  }

  _switchOrderStatus(event, emit) async {
    state.pageNo = 1;
    state.orderList.clear();
    state.status = event.status;
    state.loadStatus = LoadStatus.loading;
    state.requestTimeStamp = event.requestTimeStamp;
    state.showLoading = true;
    emit(state.copy());
    await OrderApi.getOrderList(event.status, state.pageNo, state.pageSize).then((value) {
      if (state.requestTimeStamp == event.requestTimeStamp) {
        state.orderList = value;
      }
    }).catchError((onError) {
      logE(onError);
    });
    state.showLoading = false;
    emit(state.copy());
  }

  _onLoading(event, emit) async {
    state.loadStatus = LoadStatus.loading;
    state.requestTimeStamp = event.requestTimeStamp;
    await OrderApi.getOrderList(state.status, state.pageNo + 1, state.pageSize).then((value) {
      state.loadStatus = LoadStatus.idle;
      if (state.requestTimeStamp == event.requestTimeStamp) {
        if (value.isNotEmpty) {
          state.pageNo++;
          state.orderList.addAll(value);
        } else {
          state.loadStatus = LoadStatus.noMore;
        }
      }
    }).catchError((error) {
      state.loadStatus = LoadStatus.failed;
    });
    emit(state.copy());
  }

  _onRefresh(OnRefreshEvent event, emit) async {
    state.pageNo = 1;
    state.refreshStatus = RefreshStatus.idle;
    state.loadStatus = LoadStatus.loading;
    state.requestTimeStamp = event.requestTimeStamp!;
    emit(state.copy());
    await Future.delayed(Duration(seconds: event.delayed)).then(
      (value) => OrderApi.getOrderList(state.status, state.pageNo, state.pageSize).then((value) {
        if (state.requestTimeStamp == event.requestTimeStamp) {
          state.orderList = value;
        }
      }).catchError((onError) {}),
    );
    state.refreshStatus = RefreshStatus.completed;
    emit(state.copy());
  }

  _cancelReasonList(event, emit) async {
    state.showLoading = true;
    emit(state.copy());
    await OrderApi.getCancelReasonList(1, 1).then((value) {
      state.cancelReason = value;
      state.cancelOrderId = event.orderId;
      emit(state.copyReasonTimeStamp(event.timeStamp));
    }).catchError((onError) {});
    state.showLoading = false;
    emit(state.copy());
  }

  _cancelOrder(CancelOrderEvent event, emit) async {
    state.showLoading = true;
    emit(state.copy());
    await OrderApi.cancelOrderRequest(
      event.orderId ?? 0,
      event.orderCancelReasonId,
      event.otherReasons,
    ).then((value) {
      if (event.callBack != null) {
        event.callBack!(value);
      }
      if (value) {
        ToastUtil.show("取消成功");
      }
    }).catchError((onError) {});
    state.showLoading = false;
    emit(state.copy());
  }
}
