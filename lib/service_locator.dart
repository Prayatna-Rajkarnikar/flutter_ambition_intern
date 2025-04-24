import 'package:flutter_intern/blocs/product/product_bloc.dart';
import 'package:flutter_intern/repository/product_repository.dart';
import 'package:flutter_intern/services/product_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  print("Registering services...");

  getIt.registerLazySingleton<ProductService>(() => ProductService());

  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepository(getIt<ProductService>()),
  );

  getIt.registerFactory<ProductBloc>(
    () => ProductBloc(getIt<ProductRepository>()),
  );
}
