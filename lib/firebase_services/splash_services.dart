import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_notes/ui/auth/login_screen.dart';

class SplashServices {
  void isLoggedIn(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
  }
}
// @override
// void initState() {
//   super.initState();
//   _checkAuthStatus();
// }
//
// Future<void> _checkAuthStatus() async {
//   await Future.delayed(const Duration(seconds: 3)); // Simulate a delay
//   if (FirebaseAuth.instance.currentUser != null) {
//     // User is logged in, navigate to home screen
//     Navigator.pushReplacementNamed(context, '/home');
//   } else {
//     // User is not logged in, navigate to login screen
//     Navigator.pushReplacementNamed(context, '/login');
//   }
// }
