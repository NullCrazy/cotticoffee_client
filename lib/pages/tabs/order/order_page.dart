import 'package:cotticoffee_client/global/style.dart';
import 'package:cotticoffee_client/widget/custom_page_widget.dart';
import 'package:cotticoffee_client/widget/my_underline_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/order_bloc.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/8/31 1:44 下午
class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  final OrderBloc _bloc = OrderBloc();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _bloc.state.tabs.length);
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPageWidget(
        title: '订单列表',
        automaticallyImplyLeading: false,
        child: Column(
          children: [
            _buildTab(),
            _buildPage(),
          ],
        ));
  }

  _buildTab() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      height: 44.h,
      child: Center(
        child: TabBar(
          onTap: (index) => _changeTab(index),
          labelColor: primeColor,
          unselectedLabelColor: const Color(0xFF5F5F5F),
          labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          labelPadding: EdgeInsets.zero,
          unselectedLabelStyle: TextStyle(fontSize: 14.sp),
          indicator: MyUnderlineTabIndicator(
            width: 42.w,
            borderSide: BorderSide(
              width: 2.h,
              color: primeColor,
            ),
          ),
          controller: _tabController,
          tabs: List.generate(
            _bloc.state.tabs.length,
            (index) => Text(_bloc.state.tabs[index].name),
          ),
        ),
      ),
    );
  }

  Widget _buildPage() {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (index) => _onPageChanged(index),
      itemCount: _bloc.state.tabs.length,
      itemBuilder: (context, index) {
        // return PageItem(pageIndex: index);
        return Container();
      },
    );
  }

  void _onPageChanged(int index) {
    _tabController.index = index;
    // _bloc.add(SwitchOrderStatusEvent(_bloc.state.tabs[index].status, index));
  }

  void _changeTab(int index) => _pageController.jumpToPage(index);

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
    _tabController.dispose();
    _pageController.dispose();
  }
}
