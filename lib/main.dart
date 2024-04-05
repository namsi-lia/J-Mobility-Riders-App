import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jmobility_riders/ui/screens/SplashScreen.dart';
import 'package:jmobility_riders/lang/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('de', 'DE')],
        path: 'assests/lang', // <-- change the path of the translation files
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const SplashScreen());
  }
}
