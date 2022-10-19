import 'package:cotticoffee_client/global/style.dart';
import 'package:cotticoffee_client/pages/tabs/order/entity/order_detail_model.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_detail/bloc/order_detail_bloc.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_detail/bloc/order_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/19 9:32 PM
class BottomActionBar extends StatefulWidget {
  const BottomActionBar({Key? key}) : super(key: key);

  @override
  State<BottomActionBar> createState() => _BottomActionBarState();
}

class _BottomActionBarState extends State<BottomActionBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailBloc, OrderDetailState>(
      builder: (context, state) {
        return Container(
          height: 56.h,
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(10, 58, 59, 60),
                offset: Offset(0, -2.w), //阴影x轴偏移量
                blurRadius: 1,
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: _actions(state.orderDetail),
          ),
        );
      },
    );
  }

  List<Widget> _actions(OrderDetailModel? orderDetail) {
    if (orderDetail == null) {
      return [const SizedBox()];
    }
    List<Map<String, Function>> list = [];
    if (orderDetail.hiddenCancel == 0) {
      list.add({"取消订单": _cancelOrder});
    }
    if (orderDetail.status == 10) {
      list.add({"去支付": _toPay});
    }
    if (orderDetail.allowEvaluate == 1) {
      list.add({"去评价": _toEvaluate});
    }
    if (orderDetail.status != 10) {
      list.add({"再来一单": _againOrder});
    }
    return List.generate(list.length, (index) {
      Map<String, Function> map = list[index];
      return _buildItem(map.keys.first, map.values.first, list.length - 1 == index);
    });
  }

  Widget _buildItem(String title, Function function, bool lastChild) {
    return GestureDetector(
      onTap: () => function(),
      child: Container(
        width: 92.w,
        height: 32.h,
        margin: EdgeInsets.only(right: 14.w),
        decoration: BoxDecoration(
          color: lastChild ? primeColor : Colors.white,
          border: Border.all(width: lastChild ? 0 : 1.w, color: primeColor),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: lastChild ? Colors.white : primeColor,
            fontSize: 14.sp,
          ),
        ),
      ),
    );
  }

  void _cancelOrder() {}

  void _toPay() {}

  void _toEvaluate() {}

  void _againOrder() {}
}
