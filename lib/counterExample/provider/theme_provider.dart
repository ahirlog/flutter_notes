import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  var _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void setThem(themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
