import 'package:cotticoffee_client/pages/tabs/order/order_list/bloc/order_bloc.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_list/bloc/order_event.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_list/bloc/order_state.dart';
import 'package:cotticoffee_client/pages/tabs/order/entity/order_model.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_list/view/order_item.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_list/view/order_notification_listener.dart';
import 'package:cotticoffee_client/widget/custom_smart_footer.dart';
import 'package:cotticoffee_client/widget/custom_smart_header.dart';
import 'package:cotticoffee_client/widget/keep_alive_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/3/16 1:34 下午
class PageItem extends StatefulWidget {
  const PageItem({Key? key, required this.pageIndex}) : super(key: key);
  final int pageIndex;

  @override
  State<PageItem> createState() => _PageItemState();
}

class _PageItemState extends State<PageItem> {
  final RefreshController _controller = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state.loadStatus == LoadStatus.noMore) {
          _controller.loadNoData();
        } else {
          _controller.loadComplete();
        }
        if (state.refreshStatus == RefreshStatus.completed) {
          _controller.refreshCompleted();
        }
      },
      builder: (context, state) {
        return OrderNotificationListener(
          child: SmartRefresher(
            enablePullUp: true,
            controller: _controller,
            header: const CustomSmartHeader(),
            footer: const CustomSmartFooter(),
            onLoading: () => context.read<OrderBloc>().add(OnLoadingEvent()),
            onRefresh: () => context.read<OrderBloc>().add(OnRefreshEvent(0)),
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 12.h,bottom: 0),
              itemBuilder: (context, index) {
                OrderModel orderModel = state.orderList[index];
                return KeepAliveWrapper(
                  keepAlive: orderModel.status == 10,
                  child: OrderItem(
                    orderModel: orderModel,
                    pageIndex: widget.pageIndex,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 12.h);
              },
              itemCount: state.orderList.length,
            ),
          ),
        );
      },
    );
  }
}
