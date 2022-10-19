import 'package:cotticoffee_client/config/env.dart';
import 'package:cotticoffee_client/global/icon_font.dart';
import 'package:cotticoffee_client/global/style.dart';
import 'package:cotticoffee_client/routers/mine_router.dart';
import 'package:cotticoffee_client/routers/web_view_router.dart';
import 'package:cotticoffee_client/widget/custom_page_widget.dart';
import 'package:cotticommon/cotticommon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/12 10:27 PM
class LicensePage extends StatefulWidget {
  const LicensePage({Key? key}) : super(key: key);

  @override
  State<LicensePage> createState() => _LicensePageState();
}

class _LicensePageState extends State<LicensePage> {
  @override
  Widget build(BuildContext context) {
    return CustomPageWidget(
      title: '经营证照',
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            InkWell(
              onTap: () => NavigatorUtils.push(
                context,
                WebViewRouter.webView,
                params: {'url': '${Env.currentEnvConfig.h5}/#/platform'},
              ),
              child: _buildItem("平台资质"),
            ),
            Container(
              height: 0.5.h,
              color: dividerGray,
              margin: EdgeInsets.symmetric(horizontal: 18.w),
            ),
            InkWell(
              onTap: () => NavigatorUtils.push(
                context,
                MineRouter.shopLicensePage,
              ),
              child: _buildItem("门店资质"),
            ),
          ],
        ),
      ),
    );
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
