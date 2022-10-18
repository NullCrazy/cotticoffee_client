import 'package:cotticoffee_client/global/style.dart';
import 'package:cotticoffee_client/pages/tabs/menu/entity/menu_head.dart';
import 'package:cotticoffee_client/pages/tabs/menu/ment_page/bloc/menu_bloc.dart';
import 'package:cotticoffee_client/pages/tabs/menu/ment_page/bloc/menu_state.dart';
import 'package:cotticoffee_client/widget/mini_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/15 10:15 AM
class MenuLeftWidget extends StatefulWidget {
  final Function(num) clickItemCallBack;
  final ValueNotifier? selectIndexNotifier;

  const MenuLeftWidget({Key? key, required this.clickItemCallBack, this.selectIndexNotifier})
      : super(key: key);

  @override
  State<MenuLeftWidget> createState() => _MenuLeftWidgetState();
}

class _MenuLeftWidgetState extends State<MenuLeftWidget> {
  int selectIndex = 0;
  List<MenuHead>? menuHeads;

  @override
  void initState() {
    super.initState();
    widget.selectIndexNotifier?.addListener(_selectIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.w,
      color: Colors.white,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: _buildLine(),
          ),
          _buildList(),
        ],
      ),
    );
  }

  Widget _buildList() {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (bloc, state) {
        menuHeads = state.menuHeads;
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: menuHeads?.length ?? 0,
          itemBuilder: (context, index) {
            return _buildItem(index, state);
          },
        );
      },
    );
  }

  Widget _buildItem(int index, MenuState state) {
    return InkWell(
      onTap: () => setState(() {
        selectIndex = index;
        MenuHead menuHead = state.menuHeads[index];
        if (menuHead.items.isNotEmpty) {
          widget.clickItemCallBack(menuHead.key);
        }
      }),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: index == selectIndex
                  ? Border(right: BorderSide(width: 1.5.w, color: primeColor))
                  : null,
            ),
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 16.h),
            child: Text(
              state.menuHeads[index].firstHead.name ?? '',
              style: index == selectIndex
                  ? TextStyle(fontSize: 12.sp, color: textBlack, fontWeight: FontWeight.bold)
                  : TextStyle(fontSize: 11.sp, color: textGray),
            ),
          ),
          Positioned(
            right: 1.5.w,
            child: MiniLabelWidget(label: state.menuHeads[index].firstHead.tagUrl),
          ),
        ],
      ),
    );
  }

  Widget _buildLine() {
    return Container(
      width: 1.w,
      height: double.infinity,
      color: const Color(0xFFE9E9E9),
    );
  }

  _selectIndex() {
    int value = widget.selectIndexNotifier?.value;
    int? indexWhere = menuHeads?.indexWhere((element) => element.key == value);
    if (indexWhere != null) {
      selectIndex = indexWhere;
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.selectIndexNotifier?.removeListener(_selectIndex);
  }
}
