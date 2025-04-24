import 'package:flutter/material.dart';
import 'package:flutter_notes/routes_name.dart';
import 'package:flutter_notes/screen_a.dart';
import 'package:flutter_notes/screen_b.dart';
import 'package:flutter_notes/screen_c.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.screenA:
        return MaterialPageRoute(builder: (context) => const ScreenA());
      case RouteName.screenB:
        return MaterialPageRoute(builder: (context) => const ScreenB());
      case RouteName.screenC:
        return MaterialPageRoute(builder: (context) => const ScreenC());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(child: Text('No route defined')),
          );
        });
    }
  }
}
