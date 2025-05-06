import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/utils/routes/routes_name.dart';
import 'package:flutter_notes/view/home_screen.dart';
import 'package:flutter_notes/view/login_screen.dart';
import 'package:flutter_notes/view/signup_view.dart';
import 'package:flutter_notes/view/splash_view.dart';
import 'package:get/get.dart';

class Routes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splash,
          page: () => const SplashView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
      ];

// static Route<dynamic> generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case RoutesName.home:
//       return MaterialPageRoute(
//           builder: (BuildContext context) => const HomeScreen());
//
//     case RoutesName.login:
//       return MaterialPageRoute(
//           builder: (BuildContext context) => const LoginScreen());
//     case RoutesName.signUp:
//       return MaterialPageRoute(
//           builder: (BuildContext context) => const SignupView());
//     case RoutesName.splash:
//       return MaterialPageRoute(
//           builder: (BuildContext context) => const SplashView());
//
//     default:
//       return MaterialPageRoute(builder: (_) {
//         return const Scaffold(
//           body: Center(
//             child: Text('No route defined'),
//           ),
//         );
//       });
//   }
// }
}
