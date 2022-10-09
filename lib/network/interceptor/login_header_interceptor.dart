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
    String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9'
        '.eyJzdWIiOiJ7XCJpc05ld01lbWJlclwiOmZhbHNlLFwibWVtYmVySWRcIjo2MDE0Mjc4MDg2MCxcIm1lbWJlck5vXCI6XCI2MDE0Mjc4MDg2MFwiLFwibWVtYmVyVHlwZVwiOjAsXCJtb2JpbGVcIjpcIjE3MzM4MTM0NzU3XCIsXCJvcGVuSWRcIjpcIm9ROVpWNUJ0TXpwOHZ5V0JfRmY1SWh4MnA5RTBcIixcInVuaW9uSWRcIjpcIm8yU19MNTU3MXdYdDlmWEJZWWs5X3lrazE4dGtcIn0iLCJpc3MiOiJpc3N1ZSIsImV4cCI6Njg0OTI4NTAwOCwiaWF0IjoxNjY1Mjg1MDA4fQ.6SinG17J20GkRvpSC5L3-D4972BCh07o4gTbKzyo6KE';
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
