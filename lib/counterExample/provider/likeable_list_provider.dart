import 'package:flutter/material.dart';

// Change notifier is work like set state, it has global content
class LikeableListProvider with ChangeNotifier {
  List<int> _selectedItem = [];

  List<int> get selectedItem => _selectedItem;

  void addItem(int item) {
    _selectedItem.add(item);
    notifyListeners();
  }

  void removeItem(int item) {
    _selectedItem.remove(item);
    notifyListeners();
  }
}
