import 'env_config.dart';

/// @Date:2021/11/18
/// @Author: xingguo.lei@abite.com
/// @Description: 环境参数
class Env {
  /// flutter run --dart-define=ENV=debug,test,prod
  /// 多渠道打包
  static const env = String.fromEnvironment('ENV', defaultValue: EnvConfig.debug);

  static EnvConfig get envConfig => getEnvConfig();

  static EnvConfig getEnvConfig({String env = env}) {
    switch (env) {
      case EnvConfig.test:
        return _testConfig;
      case EnvConfig.pre:
        return _preConfig;
      case EnvConfig.prod:
        return _prodConfig;
      default:
        return _debugConfig;
    }
  }

  static final EnvConfig _debugConfig = EnvConfig(
    envName: EnvConfig.debug,
    baseUrl: "https://gatewaydev.abite.com",
    pushAppKey: "a9ee95c9bd945500dd72be6a",
  );

  static final EnvConfig _testConfig = EnvConfig(
    envName: EnvConfig.test,
    baseUrl: "https://gatewaytest1.abite.com",
    pushAppKey: "a9ee95c9bd945500dd72be6a",
  );

  static final EnvConfig _preConfig = EnvConfig(
    envName: EnvConfig.pre,
    baseUrl: "https://gatewaypre.abite.com",
    pushAppKey: "a9ee95c9bd945500dd72be6a",
  );

  static final EnvConfig _prodConfig = EnvConfig(
    envName: EnvConfig.prod,
    baseUrl: "https://gateway.abite.com",
    isDebug: false,
  );
}
