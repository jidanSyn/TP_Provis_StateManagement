class Product {
  final String title;
  final double price; // Ubah tipe data price menjadi double
  final String category;
  final String image;

  Product({
    required this.title,
    required this.price,
    required this.category,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      price: json['price'].toDouble(), // Ubah tipe data price menjadi double
      category: json['category'],
      image: json['image'],
    );
  }
}
