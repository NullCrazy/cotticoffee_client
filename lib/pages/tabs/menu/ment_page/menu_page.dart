import 'package:cotticoffee_client/pages/tabs/menu/ment_page/bloc/menu_bloc.dart';
import 'package:cotticoffee_client/pages/tabs/menu/ment_page/views/menu_left.dart';
import 'package:cotticoffee_client/pages/tabs/menu/ment_page/views/menu_right.dart';
import 'package:cotticoffee_client/widget/custom_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/menu_event.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/8/31 1:44 下午
class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with AutomaticKeepAliveClientMixin {
  final MenuBloc _bloc = MenuBloc();
  ValueNotifier toIndexNotifier = ValueNotifier(-1);
  ValueNotifier selectIndexNotifier = ValueNotifier(0);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _bloc.add(MenuListEvent(100, '20300020814'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: CustomPageWidget(
        showAppBar: false,
        child: Column(
          children: [
            _header(),
            Expanded(child: _content()),
          ],
        ),
      ),
    );
  }

  _header() {
    return Container(
      height: 100.h,
      color: Colors.grey,
    );
  }

  _banner() {
    return Container(
      height: 150.h,
      color: Colors.blueAccent,
      child: InkWell(
        onTap: () {},
        child: Text('test'),
      ),
    );
  }

  _content() {
    return Row(
      children: [
        MenuLeftWidget(
          selectIndexNotifier: selectIndexNotifier,
          clickItemCallBack: (index) {
            toIndexNotifier.value = -1;
            toIndexNotifier.value = index;
          },
        ),
        Expanded(
          child: MenuRight(
            toIndexNotifier: toIndexNotifier,
            firstItemIndexCallBack: (index) {
              selectIndexNotifier.value = index;
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }
}
