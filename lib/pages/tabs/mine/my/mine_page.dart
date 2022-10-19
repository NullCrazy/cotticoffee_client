import 'package:cotticoffee_client/config/env.dart';
import 'package:cotticoffee_client/pages/tabs/mine/my/bloc/mine_bloc.dart';
import 'package:cotticoffee_client/pages/tabs/mine/my/bloc/mine_event.dart';
import 'package:cotticoffee_client/pages/tabs/mine/my/views/switch_env.dart';
import 'package:cotticoffee_client/widget/custom_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'views/coupon_widget.dart';
import 'views/function_list.dart';
import 'views/user_info_widget.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/8/31 1:44 下午
class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin {
  final MineBloc _bloc = MineBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(InitUserInfoEvent());
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: CustomPageWidget(
        showAppBar: false,
        child: Stack(
          children: [
            Image.asset('assets/images/mine/bg_mine_head.png'),
            Image.asset('assets/images/mine/bg_mine_mask.png'),
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              children: contents(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> contents() {
    return [
      const UserInfoWidget(),
      const CouponWidget(),
      const FunctionList(),
      if (Env.currentEnvConfig.isDebug) const SwitchEnvWidget(),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }
}
