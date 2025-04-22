import 'package:bloc/bloc.dart';
import 'package:flutter_intern/blocs/product/product_event.dart';
import 'package:flutter_intern/blocs/product/product_state.dart';
import 'package:flutter_intern/repository/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc(this.repository) : super(ProductInitialState()) {
    on<ProductInitialFetchEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        final products = await repository.getProducts();
        emit(ProductFetchedState(products));
      } catch (ex) {
        emit(ProductErrorState(ex.toString()));
      }
    });
  }
}
