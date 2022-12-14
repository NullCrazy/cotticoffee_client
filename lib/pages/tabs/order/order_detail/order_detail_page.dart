import 'package:cotticoffee_client/global/icon_font.dart';
import 'package:cotticoffee_client/global/style.dart';
import 'package:cotticoffee_client/pages/tabs/order/entity/order_detail_model.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_detail/bloc/order_detail_bloc.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_detail/bloc/order_detail_event.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_detail/bloc/order_detail_state.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_detail/views/bottom_action_bar.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_detail/views/delivery_info.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_detail/views/other_widget.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_detail/views/simple_item.dart';
import 'package:cotticoffee_client/widget/custom_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/19 8:59 PM
class OrderDetailPage extends StatefulWidget {
  final String orderNo;

  const OrderDetailPage({Key? key, required this.orderNo}) : super(key: key);

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  final OrderDetailBloc _bloc = OrderDetailBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(OrderInfoEvent(widget.orderNo));
  }

  Widget _rightAction() {
    return Container(
      margin: EdgeInsets.only(right: 16.w),
      child: Icon(
        IconFont.icon_help_color,
        size: 20.w,
        color: textBlack,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return BlocBuilder<OrderDetailBloc, OrderDetailState>(
      builder: (context, state) {
        List<Widget> listView = _listView(state.orderDetail);
        return CustomPageWidget(
          title: state.orderDetail?.orderStatusStr?.statusStr ?? '',
          actions: [_rightAction()],
          child: Stack(
            children: [
              ListView(
                padding: EdgeInsets.only(bottom: 68.h),
                children: listView,
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: BottomActionBar(),
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _listView(OrderDetailModel? orderDetail) {
    List<Widget> list = [];
    if (orderDetail == null) {
      return list;
    }
    if (_bloc.state.isTakeOut) {
      list.add(const DeliveryInfo());
    }
    if (orderDetail.isEvaluate == 1) {
      list.add(SimpleItem(title: '????????????', click: () {}));
    }
    if (orderDetail.refundStatus == 3 || orderDetail.refundStatus == 2) {
      list.add(SimpleItem(title: '????????????', click: () {}));
    }
    list.add(const OtherWidget());
    return list;
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }
}
