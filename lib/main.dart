import 'package:flutter_project/core/di/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_project/src/presentation/pages/main_page.dart';

Future<void> main() async {
  /// TODO: multi language
  /// TODO: environment
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  configureDependencies();
  runApp(const MainPage());
}
