import 'package:cotticoffee_client/generated/json/base/json_field.dart';
import 'package:cotticoffee_client/generated/json/order_model.g.dart';
import 'package:cotticoffee_client/pages/tabs/order/entity/order_express.dart';

@JsonSerializable()
class OrderModels {
  OrderModels();

  factory OrderModels.fromJson(Map<String, dynamic> json) => $OrderModelsFromJson(json);

  Map<String, dynamic> toJson() => $OrderModelsToJson(this);

  List<OrderModel>? orders;
  int? pageNo;
  int? pageSize;
}

@JsonSerializable()
class OrderModel {
  OrderModel();

  factory OrderModel.fromJson(Map<String, dynamic> json) => $OrderModelFromJson(json);

  Map<String, dynamic> toJson() => $OrderModelToJson(this);

  ///订单id
  late int id;

  ///订单号
  String? orderNo;

  ///就餐形式
  int? eatType;

  ///就餐形式描述
  String? eatTypeStr;

  ///门店主数据编号
  int? shopMdCode;

  ///门店名称
  String? shopName;

  ///收货人地址
  String? takeAddress;

  /// 订单状态
  /// CREATED(10, "已新建"),
  /// SUBMITTED(20, "待履约"),
  /// ON_SERVICE(30, "已取货"),
  /// CANCELED(40, "已取消"),
  /// COMPLETE(50, "已完成");
  int? status;

  ///是否隐藏取消按钮
  ///0 否， 1 是
  int? hiddenCancel;

  ///订单状态描述
  String? appStatus;

  ///订单状态描述
  String? statusStr;

  ///配送状态
  int? expressStatus;

  ///是否已经评价：0否 1是
  int? isEvaluate;

  ///订单是否允许评价: 0否 1是
  int? allowEvaluate;

  ///截止当前时间(s)
  int? deadlineSeconds;

  ///订单支付截止时间
  String? paymentDeadlineTime;

  ///订单总实付
  String? orderActuallyPayMoney;

  ///购买商品总数量
  int? productQuantity;

  ///发货状态：0,未发货，1 已发货
  int? ship;

  /// PLATFORM_EXPRESS(1, "平台配送"),
  /// BUSINESS_SELF_EXPRESS(2, "商家自配送");
  int? expressMode;

  ///YES(1, "有赞回迁订单"),
  /// NO(2, "非有赞回迁订单");
  int? isYouzanMigrate;

  ///快递信息
  @JSONField(name: "orderExpressDetail")
  OrderExpress? orderExpress;
  List<ProductModel>? products;
}

@JsonSerializable()
class ProductModel {
  ProductModel();

  factory ProductModel.fromJson(Map<String, dynamic> json) => $ProductModelFromJson(json);

  Map<String, dynamic> toJson() => $ProductModelToJson(this);

  String? spuCode;
  String? skuCode;
  String? title;
  @JSONField(name: "num")
  int? count;
  String? picPath;
}
