import 'package:flutter_intern/data/model/product.dart';

abstract class CartState {
  List<Product> get cartItems => [];
}

class CartInitialState extends CartState {
  @override
  List<Product> get cartItems => [];
}

class CartUpdatedState extends CartState {
  final List<Product> cart;
  CartUpdatedState(this.cart);

  @override
  List<Product> get cartItems => cart;
}
