import 'package:cotticoffee_client/widget/custom_page_widget.dart';
import 'package:cotticoffee_client/widget/scroll_to_index/scroll_to_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sticky_headers/sticky_headers.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/8/31 1:44 下午
class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with AutomaticKeepAliveClientMixin {
  final AutoScrollController _controller = AutoScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return CustomPageWidget(
      showAppBar: false,
      child: Column(
        children: [
          _header(),
          Expanded(child: _content()),
        ],
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
        onTap: () {
          _controller.scrollToIndex(10,
              offset: Rect.fromLTRB(0, 50, 0, 0), preferPosition: AutoScrollPosition.begin);
        },
        child: Text('test'),
      ),
    );
  }

  _content() {
    return Row(
      children: [
        SizedBox(
          width: 75.w,
          child: ListView(),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            controller: _controller,
            itemCount: 100,
            itemBuilder: (context, index) {
              return _buildItem(index);
            },
          ),
        )
      ],
    );
  }

  Widget _buildItem(int index) {
    int groupIndex = index * 3;
    return StickyHeader(
      header: AutoScrollTag(
        key: ValueKey(groupIndex),
        index: groupIndex,
        controller: _controller,
        child: Container(
          height: 50.0,
          color: Colors.blueGrey[700],
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.centerLeft,
          child: Text(
            'Header #$groupIndex',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      content: Column(
        children: List.generate(
          2,
          (i) => AutoScrollTag(
            key: ValueKey(3 * index + i + 1),
            index: 3 * index + i + 1,
            controller: _controller,
            child: ListTile(
              title: Text('${3 * index + i + 1}'),
            ),
          ),
        ),
      ),
    );
  }
}
