import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intern/blocs/cart/cart_bloc.dart';
import 'package:flutter_intern/blocs/product/product_bloc.dart';
import 'package:flutter_intern/blocs/product/product_event.dart';
import 'package:flutter_intern/screens/product_list_screen.dart';
import 'package:flutter_intern/service_locator.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  getIt<ProductBloc>()..add(ProductInitialFetchEvent()),
        ),
        BlocProvider(create: (context) => getIt<CartBloc>()),
      ],
      child: MaterialApp(
        title: 'Bloc',
        debugShowCheckedModeBanner: false,
        home: ProductListScreen(),
      ),
    );
  }
}
