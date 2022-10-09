abstract class OrderEvent {
  int? requestTimeStamp;

  OrderEvent({this.requestTimeStamp});
}

class SwitchOrderStatusEvent extends OrderEvent {
  int status;

  SwitchOrderStatusEvent(this.status)
      : super(requestTimeStamp: DateTime.now().microsecondsSinceEpoch);
}

class OnLoadingEvent extends OrderEvent {
  OnLoadingEvent() : super(requestTimeStamp: DateTime.now().microsecondsSinceEpoch);
}

class OnRefreshEvent extends OrderEvent {
  ///(s)
  final int delayed;

  OnRefreshEvent(this.delayed) : super(requestTimeStamp: DateTime.now().microsecondsSinceEpoch);
}

class CancelReasonListEvent extends OrderEvent {
  final int orderId;
  final int timeStamp;

  CancelReasonListEvent(this.orderId, this.timeStamp);
}

class CancelOrderEvent extends OrderEvent {
  final int? orderId;
  final int? orderCancelReasonId;
  final String? otherReasons;
  final Function(bool)? callBack;

  CancelOrderEvent(this.orderId, this.orderCancelReasonId, this.otherReasons, {this.callBack});
}
