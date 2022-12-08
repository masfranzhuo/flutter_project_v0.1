import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_i18n/loaders/decoders/json_decode_strategy.dart';
import 'package:flutter_i18n/loaders/namespace_file_translation_loader.dart';
import 'package:flutter_project/core/config/base_config.dart';
import 'package:flutter_project/core/config/general_config.dart';
import 'package:flutter_project/ui/theme/theme.dart';
import 'package:flutter_project/core/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_project/app/app.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: AppTheme.primaryColor),
  );

  await Hive.initFlutter();
  await Hive.openBox('box');
  await configureDependencies(EnvConfig.environment);
  await dotenv.load(fileName: GetIt.I<BaseConfig>().envFileName);

  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
    translationLoader: NamespaceFileTranslationLoader(
      namespaces: ['error', 'label', 'model'],
      useCountryCode: true,
      fallbackDir: 'en_US',
      basePath: 'assets/flutter_i18n',
      // forcedLocale: const Locale('id', 'ID'),
      decodeStrategies: [JsonDecodeStrategy()],
    ),
    missingTranslationHandler: (key, locale) {
      debugPrint(
        '--- Missing Key: $key, languageCode: ${locale?.languageCode}',
      );
    },
  );

  runApp(
    DevicePreview(
      enabled: GetIt.I<BaseConfig>().showDebugInfo,
      builder: (context) => App(flutterI18nDelegate: flutterI18nDelegate),
    ),
  );
}
