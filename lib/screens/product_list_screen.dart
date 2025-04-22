import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intern/blocs/product/product_bloc.dart';
import 'package:flutter_intern/blocs/product/product_state.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
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
                  trailing: Icon(Icons.add_shopping_cart),
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
