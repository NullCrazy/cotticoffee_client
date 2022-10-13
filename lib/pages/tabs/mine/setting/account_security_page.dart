import 'package:cotticoffee_client/global/icon_font.dart';
import 'package:cotticoffee_client/global/style.dart';
import 'package:cotticoffee_client/utils/string_util.dart';
import 'package:cotticoffee_client/widget/custom_page_widget.dart';
import 'package:cotticommon/cotticommon.dart';
import 'package:cotticommon/global/global_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/13 5:20 PM
class AccountSecurityPage extends StatefulWidget {
  const AccountSecurityPage({Key? key}) : super(key: key);

  @override
  State<AccountSecurityPage> createState() => _AccountSecurityPageState();
}

class _AccountSecurityPageState extends State<AccountSecurityPage> {
  @override
  Widget build(BuildContext context) {
    return CustomPageWidget(
      title: '账户与安全',
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 55.h,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 12.w, right: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '手机号码',
                    style: TextStyle(fontSize: 14.sp, color: textBlack),
                  ),
                  Text(
                    StringUtil.mobilePhoneEncode(
                        GlobalBlocs.get<UserBloc>(UserBloc.blocName).state.userModel?.mobile),
                    style: TextStyle(fontSize: 14.sp, color: textBlack),
                  ),
                ],
              ),
            ),
            Container(
              height: 0.5.h,
              color: dividerGray,
              margin: EdgeInsets.symmetric(horizontal: 18.w),
            ),
            Container(
              color: Colors.white,
              height: 55.h,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 12.w, right: 4.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '注销账户',
                    style: TextStyle(fontSize: 14.sp, color: textBlack),
                  ),
                  Row(
                    children: [
                      Text(
                        '注销后无法恢复，请谨慎操作',
                        style: TextStyle(fontSize: 12.sp, color: textGray),
                      ),
                      Icon(
                        IconFont.icon_right,
                        size: 20.w,
                        color: textGray,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
