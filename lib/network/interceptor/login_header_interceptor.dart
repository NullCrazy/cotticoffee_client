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
    // String token = GlobalBlocs.get<UserBloc>(UserBloc.blocName).token;
    String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ7XCJpc05ld01lbWJlclwiOmZhbHNlLFwibWVtYmVySWRcIjo0Mjk0OTczMjYzNSxcIm1lbWJlck5vXCI6XCI0Mjk0OTczMjYzNVwiLFwibWVtYmVyVHlwZVwiOjAsXCJtb2JpbGVcIjpcIjE3MzM4MTM0NzU3XCIsXCJvcGVuSWRcIjpcIm9ROVpWNUJ0TXpwOHZ5V0JfRmY1SWh4MnA5RTBcIixcInVuaW9uSWRcIjpcIm8yU19MNTU3MXdYdDlmWEJZWWs5X3lrazE4dGtcIn0iLCJpc3MiOiJpc3N1ZSIsImV4cCI6Njg1MDA3NjQxNiwiaWF0IjoxNjY2MDc2NDE2fQ.3MwiyIxc-GInRXfqqaBIkFFN-iac5tw5baR8soU8EV0';
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
