import 'dart:async';
import 'package:flutter_notes/utils/routes/routes_name.dart';
import 'package:flutter_notes/view_model/controller/user_preference/user_preferences_view_model.dart';
import 'package:get/get.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  void isLogin() {
    userPreference.getUser().then((value) {
      print(value.token);

      if (value.token!.isEmpty || value.token.toString() == 'null') {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RoutesName.login)); // Timer
      } else {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RoutesName.home)); // Timer
      }
    });
  }
}
