import 'package:flutter_intern/data/model/product.dart';

abstract class ProductState {}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductFetchedState extends ProductState {
  final List<Product> products;
  ProductFetchedState(this.products);
}

class ProductErrorState extends ProductState {
  final String message;
  ProductErrorState(this.message);
}
