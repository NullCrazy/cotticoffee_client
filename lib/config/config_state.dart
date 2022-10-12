import 'package:cotticoffee_client/config/entity/config_entity.dart';

class ConfigState {
  ConfigEntity? configEntity;

  ConfigState copy() {
    return ConfigState()..configEntity = configEntity;
  }
}
