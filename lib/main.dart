import 'package:flutter/material.dart';
import 'package:flutter_notes/routes.dart';
import 'package:flutter_notes/routes_name.dart';
import 'package:flutter_notes/screen_a.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      initialRoute: RouteName.screenA,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
