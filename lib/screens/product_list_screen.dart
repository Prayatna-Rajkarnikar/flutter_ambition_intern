import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intern/blocs/cart/cart_bloc.dart';
import 'package:flutter_intern/blocs/cart/cart_event.dart';
import 'package:flutter_intern/blocs/cart/cart_state.dart';
import 'package:flutter_intern/blocs/product/product_bloc.dart';
import 'package:flutter_intern/blocs/product/product_state.dart';
import 'package:flutter_intern/screens/cart_screen.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (_) => const CartScreen()));
                },
              ),
              Positioned(
                right: 6,
                top: 6,
                child: IgnorePointer(
                  child: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return state.cartItems.isEmpty
                          ? const SizedBox()
                          : CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.red,
                            child: Text(
                              '${state.cartItems.length}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductErrorState) {
            return Center(child: Text("Error: ${state.message}"));
          } else if (state is ProductFetchedState) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ListTile(
                  leading: Image.network(product.image, height: 60, width: 60),
                  title: Text(product.title),
                  subtitle: Text(product.price.toString()),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<CartBloc>().add(AddToCartEvent(product));
                    },
                    icon: Icon(Icons.add_shopping_cart),
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
