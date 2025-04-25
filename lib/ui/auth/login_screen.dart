// lib/login_screen.dart

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_notes/widgets/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Future<void> _login() async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       UserCredential userCredential = await FirebaseAuth.instance
  //           .signInWithEmailAndPassword(
  //         email: _emailController.text,
  //         password: _passwordController.text,
  //       );
  //       // Navigate to Home Screen on successful login
  //       Navigator.pushReplacementNamed(context, '/home');
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == 'user-not-found') {
  //         print('No user found for that email.');
  //       } else if (e.code == 'wrong-password') {
  //         print('Wrong password provided for that user.');
  //       }
  //     }
  //   }
  // }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.alternate_email),
                  ),
                  validator: (value) {
                    return value!.isEmpty ? 'Enter email' : null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(hintText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    return value!.isEmpty ? 'Enter password' : null;
                  },
                ),
                const SizedBox(height: 20),
                RoundButton(
                  title: 'Login',
                  onTap: () {},
                  // _login,
                ),
                // TextButton(
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/signup');
                //   },
                //   child: const Text('Don\'t have an account? Sign Up'),
                // ),
                // TextButton(
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/forgot-password');
                //   },
                //   child: const Text('Forgot Password?'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
