import 'package:flutter/cupertino.dart';
import 'package:flutter_notes/model/login/user_model.dart';
import 'package:flutter_notes/repository/login_repository/login_repository.dart';
import 'package:flutter_notes/utils/routes/routes_name.dart';
import 'package:flutter_notes/utils/utils.dart';
import 'package:flutter_notes/view_model/controller/user_preference/user_preferences_view_model.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();
  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };

    _api.loginApi(data).then((value) {
      loading.value = false;
      if (value['error'] == 'user not found') {
        Utils.snackBar('Login', value['error']);
      } else {
        UserModel userModel = UserModel(
          token: value['token'],
        );

        userPreference.saveUser(userModel).then((value) {
          Get.toNamed(RoutesName.home);
        }).onError((error, stackTrace) {
          // Handle error
        });


        Utils.snackBar('Login', 'Login successfully');
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}
