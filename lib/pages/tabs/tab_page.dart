import 'package:cotticoffee_client/pages/tabs/home/home_page.dart';
import 'package:cotticoffee_client/pages/tabs/menu/menu_page.dart';
import 'package:cotticoffee_client/pages/tabs/mine/mine_page.dart';
import 'package:cotticoffee_client/pages/tabs/order/order_page.dart';
import 'package:cotticoffee_client/widget/my_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/8/30 6:06 下午
class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int dateTime = 0;
  int _selectIndex = 0;

  final List<Widget> _pages = const [HomePage(), MenuPage(), OrderPage(), MinePage()];
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return WillPopScope(
      onWillPop: _back,
      child: SafeArea(
        top: false,
        child: Stack(
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              children: _pages,
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: _buildBottomAppBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
        shape: BoxShape.circle,
      ),
      width: 60.w,
      height: 60.w,
    );
  }

  Widget _buildBottomAppBar() {
    return MyBottomAppBar(
      notchMargin: 4.w,
      shape: const CircularNotchedRectangle(),
      child: Row(
        children: [
          _buildItem('首页', 'assets/images/tab_bar/icon_home.svg', 0),
          _buildItem('点餐', 'assets/images/tab_bar/icon_menu.svg', 1),
          const Expanded(child: SizedBox()),
          _buildItem('订单', 'assets/images/tab_bar/icon_order.svg', 2),
          _buildItem('我的', 'assets/images/tab_bar/icon_mine.svg', 3),
        ],
      ),
    );
  }

  Widget _buildItem(String text, String iconName, int index) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _controller.jumpToPage(index);
          setState(() {
            _selectIndex = index;
          });
        },
        child: Column(
          children: [
            SizedBox(height: 6.h),
            SvgPicture.asset(
              iconName,
              color: index == _selectIndex ? const Color(0xFFD1775C) : const Color(0xFF444A58),
            ),
            SizedBox(height: 3.h),
            Text(
              text,
              style: TextStyle(
                color: index == _selectIndex ? const Color(0xFFD1775C) : const Color(0xFF444A58),
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }

  ///拦截返回事件
  Future<bool> _back() async {
    final int currTime = DateTime.now().millisecondsSinceEpoch;
    if (currTime - dateTime > 1000) {
      dateTime = currTime;
      return false;
    } else {
      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      return false;
    }
  }
}
