import 'package:cotticoffee_client/network/cotti_net_work_config.dart';
import 'package:cotticoffee_client/network/interceptor/login_header_interceptor.dart';
import 'package:cotticommon/network/client/cotti_http_client.dart';
import 'package:cotticommon/network/interface/network_config.dart';
import 'package:dio/dio.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/8/30 5:58 下午
class CottiNetWork extends CottiHttpClient {
  static CottiNetWork? _instance;

  CottiNetWork._();

  factory CottiNetWork() {
    _instance ??= CottiNetWork._();
    return _instance!;
  }

  @override
  List<Interceptor> get interceptors => [LoginHeaderInterceptor()];

  @override
  NetWorkConfig get networkConfig => CottiNetWorkConfig();
}
