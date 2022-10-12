import 'dart:io';

import 'package:cotticoffee_client/global/icon_font.dart';
import 'package:cotticoffee_client/global/style.dart';
import 'package:cotticoffee_client/routers/web_view_router.dart';
import 'package:cotticoffee_client/widget/cotti_image_widget.dart';
import 'package:cotticoffee_client/widget/custom_page_widget.dart';
import 'package:cotticommon/cotticommon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info/package_info.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/12 8:04 PM
class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  PackageInfo? packageInfo;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      packageInfo = await PackageInfo.fromPlatform();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPageWidget(
      title: '关于我们',
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildVersionInfo(),
            SizedBox(height: 20.h),
            _buildAgreement(),
          ],
        ),
      ),
    );
  }

  Widget _buildVersionInfo() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 14.h),
          CottiImageWidget(
            url: 'https://cdn-product-prod.yummy.tech/wechat/cotti/images/mine/ic_login_@.png',
            imgW: 83.w,
            imgH: 83.w,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 35.h),
          CottiImageWidget(
            url: 'https://cdn-product-prod.yummy.tech/wechat/cotti/images/common/login-banner.png',
            imgW: 227.w,
            imgH: 26.h,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 4.h),
          Text(
            Platform.isIOS
                ? "v${packageInfo?.version}(${packageInfo?.buildNumber})"
                : "v${packageInfo?.version}(${const String.fromEnvironment("BUILDNO",
                defaultValue: "Run")})",
            style: TextStyle(color: textGray, fontSize: 14.sp),
          ),
          SizedBox(height: 14.h),
        ],
      ),
    );
  }

  Widget _buildAgreement() {
    return Column(
      children: [
        InkWell(
          onTap: () => NavigatorUtils.push(
            context,
            WebViewRouter.webView,
            params: {'url': 'https://mtest1.cotticoffee.com/#/online/service'},
          ),
          child: _buildItem('用户使用协议'),
        ),
        Container(
          height: 0.5.h,
          color: dividerGray,
          margin: EdgeInsets.symmetric(horizontal: 18.w),
        ),
        InkWell(
          onTap: () => NavigatorUtils.push(
            context,
            WebViewRouter.webView,
            params: {'url': 'https://mtest1.cotticoffee.com/#/online/privacy'},
          ),
          child: _buildItem('用户隐私协议'),
        ),
      ],
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
