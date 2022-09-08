import 'package:cotticommon/utils/log_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @ClassName: PrivacyPolicyPage
///
/// @Description: 隐私协议弹窗页面
/// @author: hongtao.li@abite.com
/// @date: 2021-12-12

typedef PrivacyPolicyAction = Function(int actionType);

class PrivacyPolicyPage extends StatefulWidget {
  final PrivacyPolicyAction actionFunc;
  final String? okButtonTitle;
  final String? cancelButtonTitle;

  const PrivacyPolicyPage({required this.actionFunc, this.okButtonTitle, this.cancelButtonTitle});

  @override
  _PrivacyPolicyPageState createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  String privacyPolicy = '亲爱的用户，\n欢迎使用舌尖英雄APP。我们非常重视您的个人信息和隐私保护，在您使用“舌尖”服务之前，请您务必审慎阅读';

  String privacyPolicySub1 = '《用户使用协议》';
  String privacyPolicySub2 = '和';
  String privacyPolicySub3 = '《用户隐私协议》';
  String privacyPolicySub4 = '，并充分理解协议条款内容。我们将严格按照您同意的各项条款使用您的个人信息，以便为您提供更好的服务。';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildInfoWidget(context),
      ],
    );
  }

  ///
  /// 信息展示widget
  ///
  Widget _buildInfoWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        //标题
        _buildTitle(),
        _buildLine(),
        //更新信息
        _buildAppInfo(),
        //操作按钮
        _buildAction()
      ],
    );
  }

  ///
  /// 构建标题
  ///
  _buildTitle() {
    return Container(
        // padding: EdgeInsets.only(top: 16.h),
        child: Center(
      child: Text('欢迎来到舌尖英雄',
          style: TextStyle(
              fontSize: 18.sp,
              decoration: TextDecoration.none,
              color: const Color(0xff111111),
              fontWeight: FontWeight.bold)),
    ));
  }

  _buildLine() {
    return Container(
      margin: EdgeInsets.only(top: 16.h, left: 14.h, right: 14.h),
      height: 0.5.h,
      color: const Color(0xffEBEDF0),
    );
  }

  ///
  /// 构建隐私协议内容
  ///
  _buildAppInfo() {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: double.infinity, //宽度尽可能大
          maxHeight: 240.h //最小高度为50像素
          ),
      child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 27.w, right: 27.w, bottom: 22.h, top: 22.h),
          // height: 150,
          child: SingleChildScrollView(
            child: _buildTextContent(),
          )),
    );
  }

  ///构建协议内容富文本
  _buildTextContent() {
    return Text.rich(
      // 文字跨度（`TextSpan`）组件，不可变的文本范围。
      TextSpan(
        // 文本（`text`）属性，跨度中包含的文本。
        text: privacyPolicy,
        // 样式（`style`）属性，应用于文本和子组件的样式。
        style: _lowProfileStyle,
        children: [
          TextSpan(
            // 识别（`recognizer`）属性，一个手势识别器，它将接收触及此文本范围的事件。
            // 手势（`gestures`）库的点击手势识别器（`TapGestureRecognizer`）类，识别点击手势。
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Map<String, dynamic> params = {
                  'url': 'https://m.abite.com/#/service',
                  'title': '用户使用协议'
                };
                //TODO 跳webView
                // NavigatorUtils.push(context, WebViewRouter.simpleWebViewPage, params: params);
              },
            text: privacyPolicySub1,
            style: _highProfileStyle,
          ),
          TextSpan(
            text: privacyPolicySub2,
            style: _lowProfileStyle,
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                logI('点击了用户协议');
                Map<String, dynamic> params = {
                  'url': 'https://m.abite.com/#/privacy',
                  'title': '用户隐私协议'
                };
                //TODO 跳webView
                // NavigatorUtils.push(context, WebViewRouter.simpleWebViewPage, params: params);
              },
            text: privacyPolicySub3,
            style: _highProfileStyle,
          ),
          TextSpan(
            text: privacyPolicySub4,
            style: _lowProfileStyle,
          ),
        ],
      ),
    );
  }

  ///
  /// 构建取消或者升级按钮
  ///
  _buildAction() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [_buildOkButton(), _buildCancelButton()],
    );
  }

  _buildOkButton() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        widget.actionFunc(1);
      },
      child: Container(
        height: 48.h,
        decoration: BoxDecoration(
          color: const Color(0xffFF6A39),
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [
            BoxShadow(
                color: const Color(0xff470800).withOpacity(0.10),
                offset: const Offset(0, 7.5), //阴影y轴偏移量
                blurRadius: 12, //阴影模糊程度
                spreadRadius: -5 //阴影扩散程度
                ),
            BoxShadow(
                color: const Color(0xff470800).withOpacity(0.10),
                offset: const Offset(0, 12), //阴影y轴偏移量
                blurRadius: 8, //阴影模糊程度
                spreadRadius: -20 //阴影扩散程度
                )
          ],
        ),
        child: Center(
            child: Text(
          widget.okButtonTitle ?? '',
          style: TextStyle(
              color: const Color(0xffffffff),
              fontSize: 16.sp,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  _buildCancelButton() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        widget.actionFunc(0);
      },
      child: Container(
        margin: EdgeInsets.only(top: 14.h, bottom: 4.h),
        height: 48.h,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            width: 0.5,
            color: const Color(0xffFF6A39),
          ),
        ),
        child: Center(
            child: Text(
          widget.cancelButtonTitle ?? '',
          style: TextStyle(
              color: const Color(0xffFF6A39),
              fontSize: 16.sp,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}

/// 用户协议中“低调”文本的样式。
final TextStyle _lowProfileStyle = TextStyle(
  fontSize: 14.sp,
  color: const Color(0xff111111),
  height: 1.4,
  letterSpacing: 1.1,
  fontWeight: FontWeight.normal,
  decoration: TextDecoration.none,
);

/// 用户协议中“高调”文本的样式。
final TextStyle _highProfileStyle = TextStyle(
  fontSize: 14.sp,
  color: const Color(0xff1677FF),
  height: 1,
  letterSpacing: 1.1,
  fontWeight: FontWeight.normal,
  decoration: TextDecoration.none,
);
