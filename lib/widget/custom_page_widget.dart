import 'package:cotticommon/router/fluro_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/8/31 9:46 上午
class CustomPageWidget extends StatefulWidget {
  CustomPageWidget(
      {Key? key,
      required this.child,
      this.title,
      this.showAppBar = true,
      this.showLoading = false,
      this.showEmpty = false,
      this.showError = false,
      this.titleBackgroundColor = Colors.white,
      this.customEmptyWidget,
      this.customErrorWidget,
      this.customLoadingWidget,
      this.clickLeading})
      : super(key: key);

  Widget child;
  String? title;
  bool showAppBar;
  bool showError;
  bool showEmpty;
  bool showLoading;
  Widget? customErrorWidget;
  Widget? customEmptyWidget;
  Widget? customLoadingWidget;
  Function? clickLeading;
  Color titleBackgroundColor;

  @override
  State<CustomPageWidget> createState() => _CustomPageWidgetState();
}

class _CustomPageWidgetState extends State<CustomPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar ? _buildAppBar() : null,
      body: Stack(
        children: [
          widget.child,
          if (widget.showEmpty) _buildEmpty(),
          if (widget.showError) _buildError(),
          if (widget.showLoading) _buildLoading(),
        ],
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(
        widget.title ?? '',
        style: TextStyle(
          color: const Color(0xFF3A3B3C),
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: widget.titleBackgroundColor,
      elevation: 0,
      leading: UnconstrainedBox(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (widget.clickLeading == null) {
              NavigatorUtils.pop(context);
            } else {
              widget.clickLeading!();
            }
          },
          child: Container(
            padding: EdgeInsets.only(left: 16.w),
            child: SvgPicture.asset(
              'assets/images/ic_back.svg',
              width: 20.h,
              height: 20.h,
              color: const Color(0xFF111111),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return widget.customEmptyWidget ?? Container();
  }

  Widget _buildError() {
    return widget.customErrorWidget ?? Container();
  }

  Widget _buildLoading() {
    return widget.customLoadingWidget ?? Container();
  }
}
