import 'package:flutter_intern/data/model/product.dart';
import 'package:flutter_intern/services/product_service.dart';

class ProductRepository {
  final ProductService productService;

  ProductRepository(this.productService);

  Future<List<Product>> getProducts() => productService.fetchProducts();
}
