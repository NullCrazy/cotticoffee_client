import 'dart:io';

import 'package:abitelogin/login_registrar.dart';
import 'package:cotticoffee_client/network/cotti_net_work.dart';
import 'package:cotticoffee_client/routers/main_router.dart';
import 'package:cotticommon/cotticommon.dart';
import 'package:cotticommon/global/global_blocs.dart';
import 'package:cotticommon/module/module_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';

void main() {
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  realRunApp();
}

void realRunApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  MainRouter.init();
  GlobalBlocs.add({UserBloc.blocName: UserBloc()});
  ModuleManager().register(LoginRegistrar()..setClient(CottiNetWork()));
  runApp(const CottiCoffeeApp());
}
