import 'package:flutter_intern/data/datasources/contacts_local_data_source.dart';
// import 'package:flutter_intern/presentation/blocs/cart/cart_bloc.dart';
import 'package:flutter_intern/presentation/blocs/contact/contact_bloc.dart';
// import 'package:flutter_intern/presentation/blocs/product/product_bloc.dart';
// import 'package:flutter_intern/domain/repository/cart_repository.dart';
// import 'package:flutter_intern/domain/repository/product_repository.dart';
// import 'package:flutter_intern/services/cart_service.dart';
// import 'package:flutter_intern/services/product_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  print("Registering services...");

  // getIt.registerLazySingleton<ProductService>(() => ProductService());

  // getIt.registerLazySingleton<ProductRepository>(
  //   () => ProductRepository(getIt<ProductService>()),
  // );

  // getIt.registerFactory<ProductBloc>(
  //   () => ProductBloc(getIt<ProductRepository>()),
  // );

  // getIt.registerLazySingleton<CartService>(() => CartService());

  // getIt.registerLazySingleton<CartRepository>(
  //   () => CartRepository(getIt<CartService>()),
  // );

  // getIt.registerFactory<CartBloc>(() => CartBloc(getIt<CartRepository>()));

  getIt.registerLazySingleton(() => ContactsLocalDataSource());
  getIt.registerFactory(() => ContactBloc(getIt<ContactsLocalDataSource>()));
}
