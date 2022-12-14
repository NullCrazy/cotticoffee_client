import 'package:cotticoffee_client/config/env.dart';
import 'package:cotticommon/network/interface/network_config.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/8/30 5:59 下午
class CottiNetWorkConfig extends NetWorkConfig {
  @override
  String? get baseUrl => Env.currentEnvConfig.baseUrl;

  @override
  String? get appKey => Env.currentEnvConfig.ak;

  @override
  String? get signKey => Env.currentEnvConfig.sk;

  @override
  String? get apiVersion => 'v1';

  @override
  String? get version => '1.0.0';

  @override
  bool get logger => Env.currentEnvConfig.isDebug;

  @override
  String? get prefix => '/cotti-capi';
}
