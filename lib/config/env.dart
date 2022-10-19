import 'package:cotticommon/cotticommon.dart';

import 'env_config.dart';

/// @Date:2021/11/18
/// @Author: xingguo.lei@abite.com
/// @Description: 环境参数
class Env {
  /// flutter run --dart-define=ENV=debug,test,prod
  /// 多渠道打包
  static const _env = String.fromEnvironment('ENV', defaultValue: EnvConfig.pre);
  static const String keyEnv = "key_env";

  static EnvConfig get currentEnvConfig => _currentEnvConfig();

  static EnvConfig _currentEnvConfig() {
    String cacheEnv = SpUtil.getString(keyEnv);
    String currentEnv = _env;
    if (currentEnv != EnvConfig.prod && cacheEnv.isNotEmpty) {
      currentEnv = cacheEnv;
    }
    switch (currentEnv) {
      case EnvConfig.test:
        return _testConfig;
      case EnvConfig.pre:
        return _preConfig;
      case EnvConfig.prod:
        return _prodConfig;
      default:
        return _devConfig;
    }
  }

  static final EnvConfig _devConfig = EnvConfig(
    envName: EnvConfig.debug,
    baseUrl: "https://gatewaydev.abite.com",
    pushAppKey: "a9ee95c9bd945500dd72be6a",
    h5: 'https://mdev.cotticoffee.com',
  );

  static final EnvConfig _testConfig = EnvConfig(
    envName: EnvConfig.test,
    baseUrl: "https://gatewaytest1.abite.com",
    pushAppKey: "a9ee95c9bd945500dd72be6a",
    h5: 'https://mtest1.cotticoffee.com',
  );

  static final EnvConfig _preConfig = EnvConfig(
    envName: EnvConfig.pre,
    baseUrl: "https://gatewaypre.abite.com",
    pushAppKey: "a9ee95c9bd945500dd72be6a",
    h5: 'https://mpre.cotticoffee.com',
  );

  static final EnvConfig _prodConfig = EnvConfig(
    envName: EnvConfig.prod,
    baseUrl: "https://gateway.abite.com",
    h5: 'https://m.cotticoffee.com',
    isDebug: false,
  );
}
