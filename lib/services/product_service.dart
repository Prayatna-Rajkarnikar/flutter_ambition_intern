import 'dart:convert';

import 'package:flutter_intern/model/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(
      Uri.parse("https://dummyjson.com/products"),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> productJson = jsonData['products'];

      return productJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load products from api");
    }
  }
}
