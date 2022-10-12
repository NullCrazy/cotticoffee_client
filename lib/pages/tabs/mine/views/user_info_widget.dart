import 'package:cotticoffee_client/global/icon_font.dart';
import 'package:cotticoffee_client/global/style.dart';
import 'package:cotticoffee_client/pages/tabs/mine/bloc/mine_bloc.dart';
import 'package:cotticoffee_client/pages/tabs/mine/bloc/mine_state.dart';
import 'package:cotticoffee_client/utils/string_util.dart';
import 'package:cotticoffee_client/widget/cotti_image_widget.dart';
import 'package:cotticommon/bloc/user_bloc.dart';
import 'package:cotticommon/bloc/user_state.dart';
import 'package:cotticommon/global/global_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/10/10 4:29 PM
class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 150.h),
      child: BlocBuilder<MineBloc, MineState>(
        builder: (context, state) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CottiImageWidget(
                imgW: 80.w,
                imgH: 80.w,
                defaultFit: BoxFit.fill,
                url: state.userInfoEntity?.headPortrait ?? '',
                defImagePath: 'assets/images/mine/icon_default_head.png',
              ),
              SizedBox(width: 8.w),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        state.userInfoEntity?.nickname ?? '',
                        style: TextStyle(
                          color: textBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Offstage(
                        offstage: state.userInfoEntity?.nickname == null,
                        child: const Icon(IconFont.icon_right),
                      ),
                    ],
                  ),
                  BlocBuilder<UserBloc, UserState>(
                    bloc: GlobalBlocs.get(UserBloc.blocName),
                    builder: (context, state) {
                      return Offstage(
                        offstage: state.userModel?.mobile?.isEmpty ?? true,
                        child: Padding(
                          padding: EdgeInsets.only(top: 4.h),
                          child: Text(
                            StringUtil.mobilePhoneEncode(state.userModel?.mobile),
                            style: TextStyle(
                              color: textGray,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
