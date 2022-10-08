// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// /// Description:
// /// Author: xingguo.lei@abite.com
// /// Date: 2022/3/17 2:20 下午
// class OrderNotificationListener extends StatefulWidget {
//   const OrderNotificationListener({Key? key, required this.child}) : super(key: key);
//   final Widget child;
//
//   @override
//   State<OrderNotificationListener> createState() => _OrderNotificationListenerState();
// }
//
// class _OrderNotificationListenerState extends State<OrderNotificationListener> {
//   @override
//   Widget build(BuildContext context) {
//     return NotificationListener(
//       onNotification: _onNotification,
//       child: widget.child,
//     );
//   }
//
//   bool _onNotification(ScrollNotification notification) {
//     ScrollMetrics metrics = notification.metrics;
//     if (metrics.axis == Axis.vertical) {
//       TranslationCartBloc _translationBloc = BlocProvider.of<TranslationCartBloc>(context);
//       if (notification is ScrollStartNotification) {
//         _translationBloc.add(TranslationCartEvent(true));
//       } else if (notification is ScrollEndNotification) {
//         _translationBloc.add(TranslationCartEvent(false));
//       }
//     }
//     return true;
//   }
// }
