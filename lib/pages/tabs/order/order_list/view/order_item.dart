import 'dart:io';
import 'package:cotticoffee_client/pages/tabs/order/order_list/bloc/order_bloc.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_list/bloc/order_event.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_list/bloc/order_state.dart';
import 'package:cotticoffee_client/pages/tabs/order/entity/order_cancel_reason_model.dart';
import 'package:cotticoffee_client/pages/tabs/order/entity/order_model.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_list/view/cancel_order_dialog.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_list/view/to_pay_dialog.dart';
import 'package:cotticoffee_client/routers/order_router.dart';
import 'package:cotticoffee_client/utils/abite_pay_util.dart';
import 'package:cotticoffee_client/widget/countdown_timer.dart';
import 'package:cotticommon/cotticommon.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_product_item.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/3/16 2:20 下午
class OrderItem extends StatefulWidget {
  const OrderItem({Key? key, required this.orderModel, required this.pageIndex}) : super(key: key);
  final OrderModel orderModel;
  final int pageIndex;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  final ValueNotifier<int> _countNotifier = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      if ((widget.orderModel.deadlineSeconds ?? 0) > 0) {
        _countNotifier.value = widget.orderModel.deadlineSeconds!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildItem();
  }

  Widget _buildItem() {
    return InkWell(
      onTap: () {
        NavigatorUtils.push(
          context,
          OrderRouter.orderDetailPage,
          params: {"orderNo": widget.orderModel.orderNo},
        ).then((value) {
          if (value != null && value) {
            context.read<OrderBloc>().add(OnRefreshEvent(0));
          }
        });
      },
      child: Container(
        padding: EdgeInsets.only(top: 8.h, bottom: 14.h, left: 14.w, right: 14.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
        ),
        child: BlocConsumer<OrderBloc, OrderState>(
          listenWhen: (previous, current) {
            if ((widget.orderModel.deadlineSeconds ?? 0) > 0) {
              _countNotifier.value = widget.orderModel.deadlineSeconds!;
            }
            return previous.getCancelReasonTimeStamp != current.getCancelReasonTimeStamp &&
                current.cancelOrderId == widget.orderModel.id;
          },
          listener: (context, state) {
            CancelOrderDialog.show(
              context,
              state.cancelReason,
              (OrderCancelReasonModel p0, String? otherReasons) {
                OrderBloc orderBloc = context.read<OrderBloc>();
                orderBloc.add(
                  CancelOrderEvent(
                    widget.orderModel.id,
                    p0.id,
                    otherReasons,
                    callBack: (status) {
                      if (status) {
                        orderBloc.add(OnRefreshEvent(1));
                      }
                    },
                  ),
                );
              },
            );
          },
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTitle(),
                SizedBox(height: 8.h),
                _buildProducts(),
                _buildBottom(),
              ],
            );
          },
        ),
      ),
    );
  }

  _buildTitle() {
    return Row(
      children: [
        _buildLabel(widget.orderModel.eatTypeStr ?? ''),
        SizedBox(width: 4.w),
        Expanded(
          child: _address(),
        ),
        SizedBox(width: 20.w),
        _buildStatusStr(
          widget.orderModel.status == 10 && ((widget.orderModel.deadlineSeconds ?? 0) > 0),
        ),
      ],
    );
  }

  TextStyle statusStyle() {
    Color color = const Color(0xFFCFCFCF);
    if (widget.orderModel.status == 10) {
      color = const Color(0xFFFF6A39);
    } else if (widget.orderModel.status == 20) {
      color = const Color(0xFF111111);
    }
    return TextStyle(
      fontSize: 12.sp,
      color: color,
      fontWeight: FontWeight.w500,
    );
  }

  _buildLabel(String takeTypeName) {
    return Offstage(
      offstage: takeTypeName.isEmpty,
      child: Container(
        padding: Platform.isAndroid
            ? EdgeInsets.only(left: 5.w, right: 5.w, top: 2.h, bottom: 1.h)
            : EdgeInsets.only(left: 5.w, right: 5.w, top: 0.h, bottom: 1.h),
        decoration: BoxDecoration(
          color: const Color(0xFFFF6A39),
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
          border: Border.all(color: const Color(0xFFFF6A39), width: 0.5.w),
        ),
        child: Text(
          takeTypeName,
          strutStyle: Platform.isAndroid
              ? StrutStyle(
                  forceStrutHeight: true,
                  fontSize: 11.sp,
                )
              : null,
          style: TextStyle(
            color: Colors.white,
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _address() {
    OrderModel orderModel = widget.orderModel;
    return Text(
      (orderModel.eatType == 1 ? orderModel.shopName : orderModel.takeAddress) ?? '',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: const Color(0xFF111111),
        fontSize: 12.sp,
      ),
    );
  }

  Widget _buildStatusStr(bool isWaitPay) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: isWaitPay ? EdgeInsets.zero : EdgeInsets.only(top: 10.h, bottom: 10.h),
          child: Text(
            widget.orderModel.statusStr ?? '',
            style: statusStyle(),
          ),
        ),
        Visibility(
          visible: isWaitPay,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CountDownTimer(
                callback: () => context.read<OrderBloc>().add(OnRefreshEvent(1)),
                notifier: _countNotifier,
              ),
              SizedBox(height: 4.h),
              Text(
                '后订单将自动关闭',
                style: TextStyle(
                  color: const Color(0xFF111111),
                  fontSize: 12.sp,
                ),
                strutStyle: const StrutStyle(forceStrutHeight: true),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildProducts() {
    return SizedBox(
      height: 80.h,
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                ListView.separated(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return OrderProductItem(productModel: widget.orderModel.products![index]);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 9.w);
                  },
                  itemCount: widget.orderModel.products?.length ?? 0,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 76.h,
                    width: 38.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white.withOpacity(0), Colors.white.withOpacity(0.8)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "¥${Decimal.tryParse(widget.orderModel.orderActuallyPayMoney ?? '0')}",
                style: TextStyle(
                  color: const Color(0xFF111111),
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
              Text(
                "共${widget.orderModel.productQuantity ?? 0}件",
                style: TextStyle(
                  color: const Color(0xFFCFCFCF),
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildBottom() {
    List<Widget> btns = listBtn();
    return Column(
      children: [
        SizedBox(height: btns.isNotEmpty ? 12.h : 0.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: btns,
        ),
      ],
    );
  }

  List<Widget> listBtn() {
    List<Widget> list = [];
    if (widget.orderModel.hiddenCancel == 0) {
      list.add(
        _buildBtn(
          "取消订单",
          list.isNotEmpty,
          () => context.read<OrderBloc>().add(
              CancelReasonListEvent(widget.orderModel.id, DateTime.now().microsecondsSinceEpoch)),
        ),
      );
    }

    if (widget.orderModel.status == 10) {
      list.add(
        _buildBtn(
          "去支付",
          list.isNotEmpty,
          () => _toPay(),
        ),
      );
    }

    if (widget.orderModel.status != 10) {
      list.add(
        _buildBtn(
          "再来一单",
          (list.isNotEmpty ||
              !(widget.orderModel.isEvaluate == 0 &&
                  widget.orderModel.allowEvaluate == 1 &&
                  widget.orderModel.isYouzanMigrate != 1)),
          () => _addToCart(),
        ),
      );
    }

    if (widget.orderModel.isEvaluate == 0 &&
        widget.orderModel.allowEvaluate == 1 &&
        widget.orderModel.isYouzanMigrate != 1) {
      list.add(
        _buildBtn(
          "去评价",
          list.isNotEmpty,
          () => _toEvaluate(widget.orderModel.id),
        ),
      );
    }
    return list;
  }

  Widget _buildBtn(String text, bool isMore, VoidCallback callback) {
    return InkWell(
      onTap: () {
        callback();
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 14.w),
        height: 30.h,
        width: 88.w,
        decoration: BoxDecoration(
          color: isMore ? const Color(0xFFFF6A39) : Colors.white,
          border: Border.all(
            color: const Color(0xFFFF6A39),
            width: 0.5.w,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isMore ? Colors.white : const Color(0xFFFF6A39),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          strutStyle: const StrutStyle(
            forceStrutHeight: true,
          ),
        ),
      ),
    );
  }

  void _toPay() {
    ToPayDialog.show(
      context,
      double.tryParse(widget.orderModel.orderActuallyPayMoney ?? "0") ?? 0,
      "${widget.orderModel.id}",
      widget.orderModel.orderNo ?? '',
      (ABitePayResult payResult) {
        if (payResult.state == ABitPayState.succeed) {
          context.read<OrderBloc>().add(OnRefreshEvent(1));
        } else {
          logD(payResult.msg);
        }
      },
    );
  }

  void _toEvaluate(orderId) {
    // NavigatorUtils.push(context, EvaluateRouter.orderEvaluatePage, params: {'orderId': orderId})
    //     .then((value) {
    //   if (value is bool && value) {
    //     context.read<OrderBloc>().add(OnRefreshEvent(0));
    //   }
    // });
  }

  void _addToCart() async {}

  bool expressMode() {
    if (widget.orderModel.orderExpress?.expressOrderNo?.isEmpty ?? true) {
      return false;
    }
    if (widget.orderModel.expressMode == 1) {
      return widget.orderModel.orderExpress?.expressInfoList?.isNotEmpty ?? false;
    }
    return widget.orderModel.expressMode == 2;
  }
}
