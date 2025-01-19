import 'package:flutter/material.dart';

// Change notifier is work like set state, it has global content
class TimerProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void setCount() {
    _count++;
    notifyListeners();
  }
}
