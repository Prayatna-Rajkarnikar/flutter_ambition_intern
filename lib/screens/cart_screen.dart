import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intern/blocs/cart/cart_bloc.dart';
import 'package:flutter_intern/blocs/cart/cart_event.dart';
import 'package:flutter_intern/blocs/cart/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});


  @override
  Widget build(BuildContext context) {
    context.read<CartBloc>().add(LoadCartEvent());


    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final cartItems = state.cartItems;
          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final product = cartItems[index];
              print('Image URL: ${product.image}');

              return ListTile(
                leading: Image.network(product.image, height: 60, width: 60),
                title: Text(product.title),
                trailing: IconButton(
                  onPressed: () {
                    context.read<CartBloc>().add(RemoveFromCartEvent(product));
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
