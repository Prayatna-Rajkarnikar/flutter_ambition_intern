import 'package:flutter_intern/model/product.dart';

abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  final Product product;
  AddToCartEvent(this.product);
}

class RemoveFromCartEvent extends CartEvent {
  final Product product;
  RemoveFromCartEvent(this.product);
}

class LoadCartEvent extends CartEvent {}

