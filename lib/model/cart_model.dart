import 'package:flutter/material.dart';

class CartModel with ChangeNotifier{

  final List _shopItems = [
    ["Zinger Burger", "380", "images/burger.png", Colors.yellow],
    ["Fries", "150", "images/fries.png", Colors.yellowAccent],
    ["Pepperoni Pizza", "1000", "images/pizza.png", Colors.orangeAccent],
    ["Pepsi Can", "100", "images/pepsi.png", Colors.blueAccent],
    ["Tortilla Wrap", "430", "images/tortilla.png", Colors.orange],
    ["Crunchy Pasta", "550", "images/pasta.png", Colors.deepOrangeAccent],
  ];

  List _cartItems = [];

  get shopItems => _shopItems;

  get cartItems => _cartItems;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  String calculateTotal() {
    int totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += int.parse(_cartItems[i][1]);
    }
    return totalPrice.toString();
  }
}
