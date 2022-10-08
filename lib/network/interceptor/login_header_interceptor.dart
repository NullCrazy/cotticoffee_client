import 'package:abitelogin/abitelogin.dart';
import 'package:cotticommon/bloc/user_event.dart';
import 'package:cotticommon/cotticommon.dart';
import 'package:cotticommon/global/global_blocs.dart';
import 'package:dio/dio.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/6/7 4:13 下午
class LoginHeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String token = GlobalBlocs.get<UserBloc>(UserBloc.blocName).token;
    if (token.isNotEmpty) {
      options.headers.addAll({"token": token});
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final dynamic responseData = response.data;
    final int code = responseData['code'] ?? -1000;
    if ([-110, -111].contains(code)) {
      if (LoginRouter.navigatorKey.currentContext != null) {
        GlobalBlocs.get(UserBloc.blocName).add(UserLogoutEvent());
        LoginUtils.navLoginPage(LoginRouter.navigatorKey.currentContext!);
      }
    }
    handler.next(response);
  }
}
