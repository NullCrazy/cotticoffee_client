abstract class OrderDetailEvent {}

class OrderInfoEvent extends OrderDetailEvent {
  final String orderId;

  OrderInfoEvent(this.orderId);
}
