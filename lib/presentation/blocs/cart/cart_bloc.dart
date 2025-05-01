import 'package:bloc/bloc.dart';
import 'package:flutter_intern/presentation/blocs/cart/cart_event.dart';
import 'package:flutter_intern/presentation/blocs/cart/cart_state.dart';
import 'package:flutter_intern/domain/repository/cart_repository.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;

  CartBloc(this.repository) : super(CartInitialState()) {
    on<AddToCartEvent>((event, emit) async {
      await repository.addToCart(event.product);
      final updatedCart = await repository.getCart();
      emit(CartUpdatedState(updatedCart));
    });

    on<RemoveFromCartEvent>((event, emit) async {
      await repository.removeFromCart(event.product);
      final updatedCart = await repository.getCart();
      emit(CartUpdatedState(updatedCart));
    });

    on<LoadCartEvent>((event, emit) async {
      final cart = await repository.getCart();
      emit(CartUpdatedState(cart));
    });
  }
}
