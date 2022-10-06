class OrderState {
  final List<Tab> tabs = [
    Tab("当前订单", 1),
    Tab("历史订单", 2),
  ];
}

class Tab {
  String name;
  int status;

  Tab(this.name, this.status);
}
