import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tp_provis_state_management/model/product.dart';
import 'package:http/http.dart' as http;

class ProductDataProvider with ChangeNotifier {
  String url = "https://fakestoreapi.com/products?sort=desc";
  List<Product> _productsProvider = []; // Ubah menjadi List<Product>

  List<Product> get productData =>
      _productsProvider; // Ubah menjadi List<Product>

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        _productsProvider = jsonData
            .map((json) => Product.fromJson(json))
            .toList(); // Ubah di sini

        // Infokan bahwa data telah berubah
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
