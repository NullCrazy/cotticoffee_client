import 'package:cotticoffee_client/pages/tabs/order/order_detail/order_detail_page.dart';
import 'package:cotticommon/cotticommon.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/9 3:39 PM
class OrderRouter extends ModuleRouteManager {
  static const String orderDetailPage = '/pages/tabs/order/order_detail';

  @override
  List<RouteEntry> get routes => [
        RouteEntry(
          orderDetailPage,
          handler: Handler(handlerFunc: (context, params) {
            final String orderNo = params['orderNo']?.first ?? '';
            return OrderDetailPage(
              orderNo: orderNo,
            );
          }),
        ),
      ];
}
