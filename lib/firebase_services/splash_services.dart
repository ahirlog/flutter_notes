// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_notes/ui/auth/login_screen.dart';
//
// class SplashServices {
//   void isLoggedIn(BuildContext context) {
//     if (FirebaseAuth.instance.currentUser != null) {
//       // User is logged in, navigate to home screen
//       Timer(const Duration(seconds: 3), () {
//         Navigator.pushReplacementNamed(context, '/home');
//       });
//     } else {
//       // User is not logged in, navigate to login screen
//       Timer(const Duration(seconds: 3), () {
//         Navigator.pushReplacementNamed(context, '/login');
//       });
//     }
//   }
// }
