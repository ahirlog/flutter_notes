import 'package:flutter/material.dart';
import 'package:flutter_notes/models/product_model.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  double get totalPrice {
    return _items.values
        .fold(0.0, (sum, item) => sum + item.product.price * item.quantity);
  }

  void addToCart(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity++;
    } else {
      _items[product.id] = CartItem(product: product);
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void incrementQuantity(String productId) {
    if (_items.containsKey(productId)) {
      _items[productId]!.quantity++;
      notifyListeners();
    }
  }

  void decrementQuantity(String productId) {
    if (_items.containsKey(productId) && _items[productId]!.quantity > 1) {
      _items[productId]!.quantity--;
      notifyListeners();
    }
  }
}
