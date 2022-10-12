import 'package:cotticoffee_client/config/config_bloc.dart';
import 'package:cotticoffee_client/config/config_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/splash/splash_page.dart';

/// Description:
/// Author: xingguo.lei@abite.com
/// Date: 2022/8/30 5:28 下午
class CottiCoffeeApp extends StatelessWidget {
  const CottiCoffeeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: () => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: MaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('zh', 'CN'),
              Locale('en', 'US'),
            ],
            home: const SplashPage(),
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: MultiBlocProvider(
                  providers: [
                    BlocProvider<ConfigBloc>(
                      create: (BuildContext context) => ConfigBloc()..add(GetConfigEvent()),
                    ),
                  ],
                  child: widget!,
                ),
              );
            }),
      ),
    );
  }
}
