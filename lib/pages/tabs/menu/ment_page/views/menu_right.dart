import 'package:cotticoffee_client/global/style.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/base_menu.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/menu_classify.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/menu_head.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/menu_item_entity.dart';
import 'package:cotticoffee_client/pages/tabs/menu/ment_page/bloc/menu_bloc.dart';
import 'package:cotticoffee_client/pages/tabs/menu/ment_page/bloc/menu_state.dart';
import 'package:cotticoffee_client/widget/cotti_image_widget.dart';
import 'package:cotticoffee_client/widget/scroll_to_index/scroll_to_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sticky_headers/sticky_headers.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/16 9:48 PM
class MenuRight extends StatefulWidget {
  const MenuRight({Key? key}) : super(key: key);

  @override
  State<MenuRight> createState() => _MenuRightState();
}

class _MenuRightState extends State<MenuRight> {
  final AutoScrollController _controller = AutoScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 12.w, top: 12.h, right: 4.w),
            controller: _controller,
            itemCount: state.menuHeads.length,
            itemBuilder: (context, index) {
              return _buildItem(state.menuHeads[index]);
            },
          ),
        );
      },
    );
  }

  Widget _buildItem(MenuHead menuHead) {
    return StickyHeader(
      header: AutoScrollTag(
        key: ValueKey(menuHead.key),
        index: menuHead.key,
        controller: _controller,
        child: Container(
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
          return AutoScrollTag(
            key: ValueKey(baseMenu.key),
            index: baseMenu.key!,
            controller: _controller,
            child: itemWidget,
          );
        }),
      ),
    );
  }

  Widget _buildSubHead(MenuClassify classify) {
    return Container(
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
    );
  }

  Widget _buildProductItem(MenuItemEntity menuItemEntity) {
    return Row(
      children: [
        SizedBox(
          width: 100.w,
          height: 100.w,
          child: CottiImageWidget(url: menuItemEntity.litimgUrl ?? ''),
        )
      ],
    );
  }
}
