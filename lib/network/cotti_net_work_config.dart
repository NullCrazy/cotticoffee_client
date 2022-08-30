import 'package:cotticommon/network/interface/network_config.dart';
import 'package:flutter/foundation.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/8/30 5:59 下午
class CottiNetWorkConfig extends NetWorkConfig {
  @override
  String? get apiVersion => 'v1';

  @override
  String? get appKey => '5fbb7622fc154f9ca177e6339c222ccb';

  @override
  String? get baseUrl => 'http://gatewaytest1.abite.com';

  @override
  String? get signKey => 'eb61231608f46e896bc3d44ed1138b0f';

  @override
  String? get version => '1.0.0';

  @override
  bool get logger => kDebugMode;
}
