import 'dart:async';
import 'dart:math';

import 'package:cotticoffee_client/global/style.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/base_menu.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/menu_classify.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/menu_head.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/menu_item_entity.dart';
import 'package:cotticoffee_client/pages/tabs/menu/ment_page/bloc/menu_bloc.dart';
import 'package:cotticoffee_client/pages/tabs/menu/ment_page/bloc/menu_state.dart';
import 'package:cotticoffee_client/widget/cotti_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:sticky_headers/sticky_headers.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/16 9:48 PM
class MenuRight extends StatefulWidget {
  final ValueNotifier? toIndexNotifier;
  final Function(int)? firstItemIndexCallBack;

  const MenuRight({Key? key, this.toIndexNotifier, this.firstItemIndexCallBack}) : super(key: key);

  @override
  State<MenuRight> createState() => _MenuRightState();
}

class _MenuRightState extends State<MenuRight> {
  final Map<int, GlobalKey<RectGetterState>> _keys = {};
  late GlobalKey<RectGetterState> _listViewKey;
  late ScrollController _controller;
  bool notifierSelectIndex = true;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _listViewKey = RectGetter.createGlobalKey();
    widget.toIndexNotifier?.addListener(_scrollToIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: NotificationListener<ScrollUpdateNotification>(
            onNotification: (notification) {
              if (widget.firstItemIndexCallBack != null && getVisible().isNotEmpty) {
                if (notifierSelectIndex) {
                  widget.firstItemIndexCallBack!(getVisible().first);
                }
              }
              return true;
            },
            child: ListView.builder(
              key: _listViewKey,
              padding: EdgeInsets.only(left: 12.w, right: 4.w),
              controller: _controller,
              itemCount: state.menuHeads.length,
              itemBuilder: (context, index) {
                return _buildItem(state.menuHeads[index]);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildItem(MenuHead menuHead) {
    _keys[menuHead.key] = RectGetter.createGlobalKey();
    return StickyHeader(
      key: _keys[menuHead.key],
      header: Container(
        color: Colors.white,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Text(
          menuHead.firstHead.name ?? '',
          style: TextStyle(
            color: textBlack,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(menuHead.items.length, (index) {
          BaseMenu baseMenu = menuHead.items[index];
          Widget itemWidget = const SizedBox();
          if (baseMenu is MenuClassify) {
            itemWidget = _buildSubHead(baseMenu);
          } else if (baseMenu is MenuItemEntity) {
            itemWidget = _buildProductItem(baseMenu);
          }
          return itemWidget;
        }),
      ),
    );
  }

  Widget _buildSubHead(MenuClassify classify) {
    _keys[classify.key!] = RectGetter.createGlobalKey();
    return InkWell(
      onTap: () => jumpTo(classify.key!),
      child: Container(
        key: _keys[classify.key!],
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Text(
          '${classify.name}(${classify.items?.length ?? 0})',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: textGray,
          ),
        ),
      ),
    );
  }

  Widget _buildProductItem(MenuItemEntity menuItemEntity) {
    _keys[menuItemEntity.key!] = RectGetter.createGlobalKey();
    return Row(
      key: _keys[menuItemEntity.key!],
      children: [
        SizedBox(
          width: 100.w,
          height: 100.w,
          child: CottiImageWidget(
            url: menuItemEntity.litimgUrl ?? '',
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }

  List<int> getVisible() {
    var listRect = RectGetter.getRectFromKey(_listViewKey);
    List<int> _items = [];
    _keys.forEach((index, key) {
      var itemRect = RectGetter.getRectFromKey(key);
      if (listRect != null &&
          itemRect != null &&
          !(itemRect.top > listRect.bottom || itemRect.bottom < listRect.top)) {
        _items.add(index);
      }
    });
    return _items;
  }

  Future<void> scrollLoop(int target, Rect listRect) async {
    var first = getVisible().first;
    bool direction = first < target;
    Rect? _rect;
    if (_keys.containsKey(target)) {
      _rect = RectGetter.getRectFromKey(_keys[target]!);
    }
    if (_rect == null || (direction ? _rect.bottom < listRect.top : _rect.top > listRect.bottom)) {
      var offset = _controller.offset + (direction ? listRect.height / 2 : -listRect.height / 2);
      offset = offset < 0.0 ? 0.0 : offset;
      offset = offset > _controller.position.maxScrollExtent
          ? _controller.position.maxScrollExtent
          : offset;
      _controller.jumpTo(offset);
      Completer completer = Completer();
      Timer(const Duration(milliseconds: 10), () async {
        await scrollLoop(target, listRect);
        completer.complete();
      });
      await completer.future;
    } else {
      double offset = _controller.offset + _rect.top - listRect.top;
      offset = offset > _controller.position.maxScrollExtent
          ? _controller.position.maxScrollExtent
          : offset;
      _controller.jumpTo(offset);
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        offset = min(offset, _controller.position.maxScrollExtent);
        if (_controller.offset != offset) {
          _controller.jumpTo(offset);
        }
      });
    }
  }

  void jumpTo(int target) async {
    var listRect = RectGetter.getRectFromKey(_listViewKey);
    if (listRect != null) {
      notifierSelectIndex = false;
      await scrollLoop(target, listRect);
      notifierSelectIndex = true;
    }
  }

  _scrollToIndex() {
    int index = widget.toIndexNotifier?.value;
    if (index != -1) {
      jumpTo(index);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    widget.toIndexNotifier?.removeListener(_scrollToIndex);
  }
}
