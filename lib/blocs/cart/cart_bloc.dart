import 'package:bloc/bloc.dart';
import 'package:flutter_intern/blocs/cart/cart_event.dart';
import 'package:flutter_intern/blocs/cart/cart_state.dart';
import 'package:flutter_intern/model/product.dart';
import 'package:flutter_intern/repository/cart_repository.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;

  CartBloc(this.repository) : super(CartInitialState()) {
    on<AddToCartEvent>((event, emit) {
      final updatedCart = List<Product>.from(state.cartItems)
        ..add(event.product);
      emit(CartUpdatedState(updatedCart));
    });

    on<RemoveFromCartEvent>((event, emit) {
      final updatedCart = List<Product>.from(state.cartItems)
        ..remove(event.product);
      emit(CartUpdatedState(updatedCart));
    });
  }
}
