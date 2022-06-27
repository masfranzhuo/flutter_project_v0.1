import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_project/core/config/base_config.dart';
import 'package:flutter_project/src/presentation/pages/home_page/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class MainPage extends StatelessWidget {
  final FlutterI18nDelegate flutterI18nDelegate;

  const MainPage({
    Key? key,
    required this.flutterI18nDelegate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, widget) => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: GetIt.I<BaseConfig>().showDebugInfo,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: [
          flutterI18nDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('id', 'ID'),
        ],
        home: const HomePage(),
      ),
<<<<<<< HEAD
=======
      localizationsDelegates: [
        flutterI18nDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('id', 'ID'),
      ],
      home: const HomePage(),
>>>>>>> 773bb7b (fix home page title)
    );
  }
}
