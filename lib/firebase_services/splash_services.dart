import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/firestore/firestore_list_screen.dart';
import 'package:flutter_notes/ui/auth/login_screen.dart';

class SplashServices {
  void isLoggedIn(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      // User is logged in, navigate to home screen
      Timer(const Duration(seconds: 3), () {
        // Navigator.pushReplacementNamed(context, '/home');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const FireStoreListScreen()));
      });
    } else {
      // User is not logged in, navigate to login screen
      Timer(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, '/login');
      });
    }
  }
}
