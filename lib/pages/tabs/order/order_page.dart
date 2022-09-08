import 'package:cotticoffee_client/widget/custom_page_widget.dart';
import 'package:flutter/material.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/8/31 1:44 下午
class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return CustomPageWidget(
      title: '订单列表',
      automaticallyImplyLeading: false,
      child: Text('订单'),
    );
  }
}
