class Product {
  final int id;
  final String title;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'thumbnail': image, 'price': price};
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      price: json['price'].toDouble() ?? 0.0,
      image: json['thumbnail'] ?? '',
    );
  }



}
