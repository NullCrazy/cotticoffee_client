import 'package:cotticoffee_client/pages/tabs/order/entity/order_detail_model.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_detail/bloc/order_detail_bloc.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_detail/bloc/order_detail_state.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_detail/views/common_box.dart';
import 'package:cotticoffee_client/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import 'order_info_item.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/20 9:13 PM
class DeliveryInfo extends StatelessWidget {
  const DeliveryInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailBloc, OrderDetailState>(
      builder: (context, state) {
        return CommonBox(
          padding: EdgeInsets.only(left: 12.w, right: 12.w, top: 16.h),
          child: Column(
            children: [
              OrderInfoItem('收货详情：', _getAddress(state.orderDetail!), subTitleFontSize: 13.sp),
              if (_expressUserName(state.orderDetail!) != null && _expressUserPhone(state.orderDetail!) != null)
                OrderInfoItem(
                  '联系骑手：',
                  _expressUserName(state.orderDetail!),
                  rightIcon: '',
                  clickRight: () => launch("tel:${_expressUserPhone(state.orderDetail!)}"),
                ),
              OrderInfoItem('预计送达：', state.orderDetail?.expectTakeBeginTime),
            ],
          ),
        );
      },
    );
  }

  _getAddress(OrderDetailModel orderDetail) {
    var takeHumName = orderDetail.orderQueryExtend?.takeHumName;
    if (orderDetail.orderQueryExtend?.takeHumSex == 1) {
      takeHumName = "$takeHumName先生";
    }
    if (orderDetail.orderQueryExtend?.takeHumSex == 2) {
      takeHumName = "$takeHumName女士";
    }
    String takePhone = orderDetail.orderQueryExtend?.takeHumPhone ?? '';
    if (takePhone.isNotEmpty) {
      takeHumName = '$takeHumName | ${StringUtil.mobilePhoneEncode(takePhone)}';
    }
    return "$takeHumName\n${orderDetail.orderQueryExtend?.takeAddress}";
  }

  _expressUserName(OrderDetailModel orderDetail) {
    if (orderDetail.expressMode == 1) {
      return orderDetail.orderExpress?.expressUserName;
    } else {
      return '商家自配送';
    }
  }

  _expressUserPhone(OrderDetailModel orderDetail) {
    if (orderDetail.expressMode == 1) {
      return orderDetail.orderExpress?.expressUserPhone;
    } else {
      return orderDetail.orderQueryExtend?.shopPhone;
    }
  }
}
