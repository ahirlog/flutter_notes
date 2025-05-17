import 'package:flutter/material.dart';
import 'package:flutter_notes/res/getx_localization/languages.dart';
import 'package:flutter_notes/utils/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: Languages(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      getPages: Routes.appRoutes(),
    );
  }
}
