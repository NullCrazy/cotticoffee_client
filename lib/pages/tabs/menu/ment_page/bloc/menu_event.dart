abstract class MenuEvent {}

class MenuListEvent extends MenuEvent {
  final int takeFoodMode;
  final String shopMdCode;

  MenuListEvent(this.takeFoodMode, this.shopMdCode);
}
