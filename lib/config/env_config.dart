import 'dart:io';

/// FileName: env_config
///
/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2021/11/29
class EnvConfig {
  ///开发环境
  static const String dev = "dev";

  ///测试环境
  static const String test = "test";

  ///测试环境
  static const String pre = "pre";

  ///正式环境
  static const String prod = "prod";

  ///默认debug模式，在prod时 置为false
  final bool isDebug;

  final String envName;

  ///在此处添加需要区分环境的参数
  final String baseUrl;
  final String? pushAppKey;

  ///默认添加了测试环境，线上重新传
  final String? wxAppID;
  final String? wxAppSecret;
  final String? h5;

  EnvConfig({
    required this.baseUrl,
    required this.envName,
    required this.h5,
    this.isDebug = true,
    this.wxAppID = "wx9f05573841063112",
    this.wxAppSecret = "6626699a7c2c0f9ceacc8d9e91c42249",
    this.pushAppKey = "9ed8c1a86c5195c816dfa362",
  });

  String get ak {
    if (envName == prod || envName == pre) {
      return Platform.isAndroid
          ? "Prq5qwZBTI4SBxvWvso5srnA7ptHnKZd"
          : "363fd453ec682fa6fbc4292289ebbe72";
    }
    return Platform.isAndroid
        ? "Ku0ShaW2X5uz3xXABvdGfdzx68cwfqJk"
        : "363fd453ec682fa6fbc4292289ebbe72";
  }

  String get sk {
    if (envName == prod || envName == pre) {
      return Platform.isAndroid
          ? "weWTyNcky0adUITdcharyB5LXjVNQnrB"
          : "363fd453ec682fa6fbc4292289ebbe72";
    }
    return Platform.isAndroid
        ? "n8oErZzHIPpM5ZcB4dLNifA50orTKU6a"
        : "41c9ad3d5ff17384e0c27f876602484a";
  }
}
