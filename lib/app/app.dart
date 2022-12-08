import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_project/core/config/base_config.dart';
import 'package:flutter_project/core/route/route.dart';
import 'package:flutter_project/ui/theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class App extends StatelessWidget {
  final FlutterI18nDelegate flutterI18nDelegate;
  final _router = AppRoute.router();

  App({
    Key? key,
    required this.flutterI18nDelegate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, widget) => MaterialApp.router(
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        title: GetIt.I<BaseConfig>().appName,
        debugShowCheckedModeBanner: GetIt.I<BaseConfig>().showDebugInfo,
        theme: AppTheme.light,
        localizationsDelegates: [
          flutterI18nDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('id', 'ID'),
        ],
      ),
    );
  }
}
