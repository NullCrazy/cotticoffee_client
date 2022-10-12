import 'package:cotticoffee_client/global/icon_font.dart';
import 'package:cotticoffee_client/global/style.dart';
import 'package:cotticoffee_client/routers/mine_router.dart';
import 'package:cotticommon/cotticommon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/11 6:04 PM
class FunctionList extends StatelessWidget {
  const FunctionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 12.h),
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildItem(IconFont.icon_address, '地址管理');
          }
          if (index == 1) {
            return _buildItem(IconFont.icon_gift, '社群福利');
          }
          if (index == 2) {
            return _buildItem(IconFont.icon_help, '客服帮助');
          }
          if (index == 3) {
            return GestureDetector(
              onTap: () => NavigatorUtils.push(context, MineRouter.settingPage),
              behavior: HitTestBehavior.opaque,
              child: _buildItem(IconFont.icon_system, '设置'),
            );
          }
          return const SizedBox();
        },
        separatorBuilder: (context, index) {
          return Container(
            height: 0.5.h,
            color: dividerGray,
            margin: EdgeInsets.only(left: 26.w, right: 10.w),
          );
        },
        itemCount: 4,
      ),
    );
  }

  Widget _buildItem(IconData iconData, String title) {
    return Container(
      height: 54.h,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 10.w, right: 4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 25.w,
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                child: Text(
                  title,
                  style: TextStyle(color: textBlack, fontSize: 14.sp),
                  strutStyle: StrutStyle(
                    forceStrutHeight: true,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          Icon(
            IconFont.icon_right,
            size: 20.w,
            color: textGray,
          ),
        ],
      ),
    );
  }
}
