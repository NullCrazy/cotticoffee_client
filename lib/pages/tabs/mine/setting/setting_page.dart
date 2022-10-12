import 'package:cotticoffee_client/global/icon_font.dart';
import 'package:cotticoffee_client/global/style.dart';
import 'package:cotticoffee_client/routers/mine_router.dart';
import 'package:cotticoffee_client/widget/custom_page_widget.dart';
import 'package:cotticommon/cotticommon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/12 7:15 PM
class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPageWidget(
        title: '设置',
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          itemBuilder: (context, index) {
            if (index == 0) {
              return _buildItem("账号与安全");
            }
            if (index == 1) {
              return _buildItem("经营证照");
            }
            if (index == 2) {
              return _buildItem("价格说明");
            }
            if (index == 3) {
              return InkWell(
                  onTap: () => NavigatorUtils.push(context, MineRouter.aboutPage),
                  child: _buildItem("关于我们"));
            }
            return const SizedBox();
          },
          separatorBuilder: (context, index) {
            return Container(
              height: 0.5.h,
              color: dividerGray,
              margin: EdgeInsets.symmetric(horizontal: 18.w),
            );
          },
          itemCount: 4,
        ));
  }

  Widget _buildItem(String name) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 12.w, right: 4.w),
      height: 55.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(color: textBlack, fontSize: 14.sp),
          ),
          Icon(
            IconFont.icon_right,
            size: 20.w,
          ),
        ],
      ),
    );
  }
}
