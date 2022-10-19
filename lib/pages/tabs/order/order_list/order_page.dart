import 'package:cotticoffee_client/global/style.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_list/bloc/order_bloc.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_list/bloc/order_event.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_list/bloc/order_state.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_list/view/page_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cotticoffee_client/widget/custom_page_widget.dart';
import 'package:cotticoffee_client/widget/my_underline_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _bloc.add(SwitchOrderStatusEvent(_bloc.state.tabs[0].status));
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPageWidget(
      title: '订单列表',
      automaticallyImplyLeading: false,
      child: BlocProvider(
        create: (context) => _bloc,
        child: BlocConsumer<OrderBloc, OrderState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                _buildTab(),
                Expanded(child: _buildPage()),
              ],
            );
          },
        ),
      ),
    );
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
          labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          labelPadding: EdgeInsets.only(bottom: 7.h),
          unselectedLabelStyle: TextStyle(fontSize: 13.sp),
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
        return PageItem(pageIndex: index);
      },
    );
  }

  void _onPageChanged(int index) {
    _tabController.index = index;
    _bloc.add(SwitchOrderStatusEvent(_bloc.state.tabs[index].status));
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
