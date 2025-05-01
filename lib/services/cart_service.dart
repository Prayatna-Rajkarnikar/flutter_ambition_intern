import 'dart:convert';

import 'package:flutter_intern/data/model/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartService {
  final _cartCacheKey = "cache_cart";

  Future<void> addToCart(Product product) async {
    final prefs = await SharedPreferences.getInstance();
    final cart = await loadCart();
    cart.add(product);

    final cartJson = cart.map((product) => product.toJson()).toList();
    prefs.setString(_cartCacheKey, jsonEncode(cartJson));
  }

  Future<List<Product>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedCart = prefs.getString(_cartCacheKey);

    if (cachedCart != null) {
      final List<dynamic> cartJson = jsonDecode(cachedCart);
      print('Cart JSON: $cartJson');

      final cartProduct =
          cartJson.map((product) => Product.fromJson(product)).toList();
      return cartProduct;
    }
    return [];
  }

  Future<void> removeFromCart(Product product) async {
    final prefs = await SharedPreferences.getInstance();

    final cart = await loadCart();
    cart.removeWhere((item) => item.id == product.id);
    final updatedCartJson = cart.map((item) => item.toJson()).toList();
    prefs.setString(_cartCacheKey, jsonEncode(updatedCartJson));
  }

  Future<void> clearCartCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_cartCacheKey);
    print('Cart cache cleared!');
  }
}
