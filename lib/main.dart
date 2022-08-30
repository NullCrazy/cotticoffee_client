import 'dart:io';

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
  runApp(const CottiCoffeeApp());
}
