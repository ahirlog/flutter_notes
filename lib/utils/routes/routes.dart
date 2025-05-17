import 'package:flutter_notes/utils/routes/routes_name.dart';
import 'package:flutter_notes/view/home/home_screen.dart';
import 'package:flutter_notes/view/auth/login_screen.dart';
import 'package:flutter_notes/view/splash/splash_screen.dart';
import 'package:get/get.dart';

class Routes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splash,
          page: () => const SplashView(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RoutesName.login,
          page: () => const LoginScreen(),
          transitionDuration: const Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
    GetPage(
      name: RoutesName.home,
      page: () => const HomeScreen(),
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
      ];
}
