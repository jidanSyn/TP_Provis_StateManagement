import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String title;
  final double price; // Ubah tipe data price menjadi double
  final String category;
  final String image;

  ProductModel({
    required this.title,
    required this.price,
    required this.category,
    required this.image,
  });

  @override
  List<Object?> get props => [title, price, category, image];

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      price: json['price'].toDouble(), // Ubah tipe data price menjadi double
      category: json['category'],
      image: json['image'],
    );
  }
}
