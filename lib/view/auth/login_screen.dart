import 'package:flutter/material.dart';
import 'package:flutter_notes/res/components/round_button.dart';
import 'package:flutter_notes/utils/utils.dart';
import 'package:flutter_notes/view_model/controller/login/login_view_model.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginVM = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: loginVM.emailController.value,
                focusNode: loginVM.emailFocusNode.value,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    Utils.snackBar('Email', 'Enter email');
                  }
                },
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(context, loginVM.emailFocusNode.value,
                      loginVM.passwordFocusNode.value);
                },
              ),
              SizedBox(height: height * .085),
              TextFormField(
                controller: loginVM.passwordController.value,
                focusNode: loginVM.passwordFocusNode.value,
                keyboardType: TextInputType.number,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: const InputDecoration(
                  hintText: 'password',
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_open),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    Utils.snackBar('Password', 'Enter Password');
                  }
                },
                onFieldSubmitted: (value) {},
              ),
              SizedBox(height: height * .085),
              Obx(
                () => RoundButton(
                    title: 'Login',
                    width: 200,
                    loading: loginVM.loading.value,
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        loginVM.loginApi();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
