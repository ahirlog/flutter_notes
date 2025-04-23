import 'package:flutter/material.dart';
import 'package:flutter_notes/res/components/round_button.dart';
import 'package:flutter_notes/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _obSecurePassword = ValueNotifier<bool>(true);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email),
              ),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(context, emailFocusNode, passFocusNode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: _obSecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obSecurePassword.value,
                    focusNode: passFocusNode,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock_open_rounded),
                      suffixIcon: InkWell(
                        onTap: () {
                          _obSecurePassword.value = !_obSecurePassword.value;
                        },
                        child: Icon(_obSecurePassword.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility), // Icon
                      ), // InkWell
                    ), // InputDecoration
                  ); // TextFormField
                }),
            RoundButton(
                title: 'Login',
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please enter email', context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Please enter password', context);
                  } else if (_passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage(
                        'Please enter 6 digit password', context);
                  } else {
                    print('api hit');
                  }
                }),
          ],
        ),
      ),
    );
  }
}
