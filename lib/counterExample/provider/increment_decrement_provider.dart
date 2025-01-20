import 'package:flutter/material.dart';

// Change notifier is work like set state, it has global content
class IncrementDecrementProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void incrementCount() {
    _count++;
    notifyListeners();
  }

  void decrementCount() {
    _count--;
    notifyListeners();
  }
}
