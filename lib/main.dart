import 'package:flutter/foundation.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_i18n/loaders/decoders/yaml_decode_strategy.dart';
import 'package:flutter_i18n/loaders/namespace_file_translation_loader.dart';
import 'package:flutter_project/core/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_project/src/presentation/pages/main_page.dart';

Future<void> main() async {
  /// TODO: environment
  WidgetsFlutterBinding.ensureInitialized();
  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
    translationLoader: NamespaceFileTranslationLoader(
      namespaces: ['label'],
      useCountryCode: true,
      fallbackDir: 'en_US',
      basePath: 'assets/flutter_i18n',
      // forcedLocale: const Locale('id', 'ID'),
      decodeStrategies: [YamlDecodeStrategy()],
    ),
    missingTranslationHandler: (key, locale) {
      if (kDebugMode) {
        print("--- Missing Key: $key, languageCode: ${locale?.languageCode}");
      }
    },
  );
  await dotenv.load();
  configureDependencies();
  runApp(MainPage(flutterI18nDelegate: flutterI18nDelegate));
}
