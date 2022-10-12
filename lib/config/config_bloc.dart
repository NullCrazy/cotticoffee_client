import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cotticoffee_client/config/entity/config_entity.dart';
import 'package:cotticoffee_client/network/cotti_net_work.dart';
import 'package:cotticommon/cotticommon.dart';

import 'config_event.dart';
import 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  ConfigBloc() : super(ConfigState()) {
    on<GetConfigEvent>(_getConfig);
  }

  _getConfig(_, emit) async {
    state.configEntity = await _config();
    state.copy();
  }

  Future<ConfigEntity> _config() async {
    Completer<ConfigEntity> completer = Completer();
    String configString = SpUtil.getString('app_config');
    CottiNetWork().post('/config/getConfig').then((value) {
      ConfigEntity configEntity = ConfigEntity.fromJson(value);
      String jsonConfig = configEntity.toString();
      SpUtil.putString('app_config', jsonConfig);
      if (configString.isEmpty) {
        completer.complete(configEntity);
      }
    });
    if (configString.isNotEmpty) {
      ConfigEntity configEntity = ConfigEntity.fromJson(jsonDecode(configString));
      completer.complete(configEntity);
    }
    return completer.future;
  }
}
