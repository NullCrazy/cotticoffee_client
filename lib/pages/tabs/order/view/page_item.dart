// import 'package:cotticoffee_client/pages/tabs/order/bloc/order_bloc.dart';
// import 'package:cotticoffee_client/pages/tabs/order/bloc/order_state.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'order_item.dart';
// import 'order_notification_listener.dart';
//
// /// Description:
// /// Author: xingguo.lei@abite.com
// /// Date: 2022/3/16 1:34 下午
// class PageItem extends StatefulWidget {
//   const PageItem({Key? key, required this.pageIndex}) : super(key: key);
//   final int pageIndex;
//
//   @override
//   State<PageItem> createState() => _PageItemState();
// }
//
// class _PageItemState extends State<PageItem> {
//   final RefreshController _controller = RefreshController(initialRefresh: false);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<OrderBloc, OrderState>(
//       listener: (context, state) {
//         if (state.loadStatus == LoadStatus.noMore) {
//           _controller.loadNoData();
//         } else {
//           _controller.loadComplete();
//         }
//         if (state.refreshStatus == RefreshStatus.completed) {
//           _controller.refreshCompleted();
//         }
//       },
//       builder: (context, state) {
//         if (state.orderList.isEmpty) {
//           return _buildEmpty();
//         }
//         return OrderNotificationListener(
//           child: SmartRefresher(
//             enablePullUp: true,
//             controller: _controller,
//             header: const CustomSmartHeader(),
//             footer: const CustomSmartFooter(),
//             onLoading: () => context.read<OrderBloc>().add(OnLoadingEvent()),
//             onRefresh: () => context.read<OrderBloc>().add(OnRefreshEvent(0)),
//             child: ListView.separated(
//               shrinkWrap: true,
//               padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 12.h, bottom: 18.h),
//               itemBuilder: (context, index) {
//                 OrderModel orderModel = state.orderList[index];
//                 return KeepAliveWrapper(
//                   keepAlive: orderModel.status == 10,
//                   child: OrderItem(
//                     orderModel: orderModel,
//                     pageIndex: widget.pageIndex,
//                   ),
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return SizedBox(height: 8.h);
//               },
//               itemCount: state.orderList.length,
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   _buildEmpty() {
//     return Container(
//       padding: EdgeInsets.only(bottom: 100.h),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SvgPicture.asset(
//             "assets/images/empty/ic_empty_order_list.svg",
//             width: 160.w,
//             height: 160.h,
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Text(
//             "您还没有相关的订单",
//             style: TextStyle(fontSize: 14.sp, color: const Color(0xFF969799)),
//           ),
//         ],
//       ),
//     );
//   }
// }
