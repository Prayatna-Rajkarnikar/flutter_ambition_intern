import 'dart:convert';

import 'package:flutter_intern/model/product.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductService {
  final _cacheKey = "cached_products";

  Future<List<Product>> fetchProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final cache = prefs.getString(_cacheKey);

    if (cache != null) {
      print("Loading from cache");
      final List<dynamic> productJson = json.decode(cache);
      final products =
          productJson.map((json) => Product.fromJson(json)).toList();
      return products;
    }

    print("Loading from API");

    final response = await http.get(
      Uri.parse("https://dummyjson.com/products"),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> productJson = jsonData['products'];

      final products =
          productJson.map((json) => Product.fromJson(json)).toList();

      await prefs.setString(_cacheKey, json.encode(productJson));
      return products;
    } else {
      throw Exception("Failed to load products from api");
    }
  }
}
