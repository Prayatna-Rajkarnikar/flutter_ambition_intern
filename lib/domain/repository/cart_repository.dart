import 'package:flutter_intern/data/model/product.dart';
import 'package:flutter_intern/services/cart_service.dart';

class CartRepository {
  final CartService cartService;

  CartRepository(this.cartService);

  Future<List<Product>> getCart() => cartService.loadCart();

  Future<void> addToCart(Product product) async {
    await cartService.addToCart(product);
  }

  Future<void> removeFromCart(Product product) async {
    await cartService.removeFromCart(product);
  }
}
