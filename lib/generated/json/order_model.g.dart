import 'package:cotticoffee_client/generated/json/base/json_convert_content.dart';
import 'package:cotticoffee_client/pages/tabs/order/model/order_model.dart';

OrderModels $OrderModelsFromJson(Map<String, dynamic> json) {
	final OrderModels orderModels = OrderModels();
	final List<OrderModel>? orders = jsonConvert.convertListNotNull<OrderModel>(json['orders']);
	if (orders != null) {
		orderModels.orders = orders;
	}
	final int? pageNo = jsonConvert.convert<int>(json['pageNo']);
	if (pageNo != null) {
		orderModels.pageNo = pageNo;
	}
	final int? pageSize = jsonConvert.convert<int>(json['pageSize']);
	if (pageSize != null) {
		orderModels.pageSize = pageSize;
	}
	return orderModels;
}

Map<String, dynamic> $OrderModelsToJson(OrderModels entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['orders'] =  entity.orders?.map((v) => v.toJson()).toList();
	data['pageNo'] = entity.pageNo;
	data['pageSize'] = entity.pageSize;
	return data;
}

OrderModel $OrderModelFromJson(Map<String, dynamic> json) {
	final OrderModel orderModel = OrderModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		orderModel.id = id;
	}
	final String? orderNo = jsonConvert.convert<String>(json['orderNo']);
	if (orderNo != null) {
		orderModel.orderNo = orderNo;
	}
	final int? eatType = jsonConvert.convert<int>(json['eatType']);
	if (eatType != null) {
		orderModel.eatType = eatType;
	}
	final String? eatTypeStr = jsonConvert.convert<String>(json['eatTypeStr']);
	if (eatTypeStr != null) {
		orderModel.eatTypeStr = eatTypeStr;
	}
	final int? shopMdCode = jsonConvert.convert<int>(json['shopMdCode']);
	if (shopMdCode != null) {
		orderModel.shopMdCode = shopMdCode;
	}
	final String? shopName = jsonConvert.convert<String>(json['shopName']);
	if (shopName != null) {
		orderModel.shopName = shopName;
	}
	final String? takeAddress = jsonConvert.convert<String>(json['takeAddress']);
	if (takeAddress != null) {
		orderModel.takeAddress = takeAddress;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		orderModel.status = status;
	}
	final int? hiddenCancel = jsonConvert.convert<int>(json['hiddenCancel']);
	if (hiddenCancel != null) {
		orderModel.hiddenCancel = hiddenCancel;
	}
	final String? appStatus = jsonConvert.convert<String>(json['appStatus']);
	if (appStatus != null) {
		orderModel.appStatus = appStatus;
	}
	final String? statusStr = jsonConvert.convert<String>(json['statusStr']);
	if (statusStr != null) {
		orderModel.statusStr = statusStr;
	}
	final int? expressStatus = jsonConvert.convert<int>(json['expressStatus']);
	if (expressStatus != null) {
		orderModel.expressStatus = expressStatus;
	}
	final int? isEvaluate = jsonConvert.convert<int>(json['isEvaluate']);
	if (isEvaluate != null) {
		orderModel.isEvaluate = isEvaluate;
	}
	final int? allowEvaluate = jsonConvert.convert<int>(json['allowEvaluate']);
	if (allowEvaluate != null) {
		orderModel.allowEvaluate = allowEvaluate;
	}
	final int? deadlineSeconds = jsonConvert.convert<int>(json['deadlineSeconds']);
	if (deadlineSeconds != null) {
		orderModel.deadlineSeconds = deadlineSeconds;
	}
	final String? paymentDeadlineTime = jsonConvert.convert<String>(json['paymentDeadlineTime']);
	if (paymentDeadlineTime != null) {
		orderModel.paymentDeadlineTime = paymentDeadlineTime;
	}
	final String? orderActuallyPayMoney = jsonConvert.convert<String>(json['orderActuallyPayMoney']);
	if (orderActuallyPayMoney != null) {
		orderModel.orderActuallyPayMoney = orderActuallyPayMoney;
	}
	final int? productQuantity = jsonConvert.convert<int>(json['productQuantity']);
	if (productQuantity != null) {
		orderModel.productQuantity = productQuantity;
	}
	final int? ship = jsonConvert.convert<int>(json['ship']);
	if (ship != null) {
		orderModel.ship = ship;
	}
	final int? expressMode = jsonConvert.convert<int>(json['expressMode']);
	if (expressMode != null) {
		orderModel.expressMode = expressMode;
	}
	final int? isYouzanMigrate = jsonConvert.convert<int>(json['isYouzanMigrate']);
	if (isYouzanMigrate != null) {
		orderModel.isYouzanMigrate = isYouzanMigrate;
	}
	final OrderExpress? orderExpress = jsonConvert.convert<OrderExpress>(json['orderExpressDetail']);
	if (orderExpress != null) {
		orderModel.orderExpress = orderExpress;
	}
	final List<ProductModel>? products = jsonConvert.convertListNotNull<ProductModel>(json['products']);
	if (products != null) {
		orderModel.products = products;
	}
	return orderModel;
}

Map<String, dynamic> $OrderModelToJson(OrderModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['orderNo'] = entity.orderNo;
	data['eatType'] = entity.eatType;
	data['eatTypeStr'] = entity.eatTypeStr;
	data['shopMdCode'] = entity.shopMdCode;
	data['shopName'] = entity.shopName;
	data['takeAddress'] = entity.takeAddress;
	data['status'] = entity.status;
	data['hiddenCancel'] = entity.hiddenCancel;
	data['appStatus'] = entity.appStatus;
	data['statusStr'] = entity.statusStr;
	data['expressStatus'] = entity.expressStatus;
	data['isEvaluate'] = entity.isEvaluate;
	data['allowEvaluate'] = entity.allowEvaluate;
	data['deadlineSeconds'] = entity.deadlineSeconds;
	data['paymentDeadlineTime'] = entity.paymentDeadlineTime;
	data['orderActuallyPayMoney'] = entity.orderActuallyPayMoney;
	data['productQuantity'] = entity.productQuantity;
	data['ship'] = entity.ship;
	data['expressMode'] = entity.expressMode;
	data['isYouzanMigrate'] = entity.isYouzanMigrate;
	data['orderExpressDetail'] = entity.orderExpress?.toJson();
	data['products'] =  entity.products?.map((v) => v.toJson()).toList();
	return data;
}

ProductModel $ProductModelFromJson(Map<String, dynamic> json) {
	final ProductModel productModel = ProductModel();
	final String? spuCode = jsonConvert.convert<String>(json['spuCode']);
	if (spuCode != null) {
		productModel.spuCode = spuCode;
	}
	final String? skuCode = jsonConvert.convert<String>(json['skuCode']);
	if (skuCode != null) {
		productModel.skuCode = skuCode;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		productModel.title = title;
	}
	final int? count = jsonConvert.convert<int>(json['num']);
	if (count != null) {
		productModel.count = count;
	}
	final String? picPath = jsonConvert.convert<String>(json['picPath']);
	if (picPath != null) {
		productModel.picPath = picPath;
	}
	return productModel;
}

Map<String, dynamic> $ProductModelToJson(ProductModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['spuCode'] = entity.spuCode;
	data['skuCode'] = entity.skuCode;
	data['title'] = entity.title;
	data['num'] = entity.count;
	data['picPath'] = entity.picPath;
	return data;
}