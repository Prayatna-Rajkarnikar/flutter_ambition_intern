import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intern/blocs/product/product_bloc.dart';
import 'package:flutter_intern/blocs/product/product_event.dart';
import 'package:flutter_intern/repository/product_repository.dart';
import 'package:flutter_intern/screens/product_list_screen.dart';
import 'package:flutter_intern/services/product_service.dart';

void main() {
  final productRepo = ProductRepository(ProductService());
  runApp(MyApp(productRepository: productRepo));
}

class MyApp extends StatelessWidget {
  final ProductRepository productRepository;
  const MyApp({super.key, required this.productRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  ProductBloc(productRepository)
                    ..add(ProductInitialFetchEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Bloc',
        debugShowCheckedModeBanner: false,
        home: ProductListScreen(),
      ),
    );
  }
}
