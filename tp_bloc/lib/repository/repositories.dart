


import 'dart:convert';

import 'package:http/http.dart';
import 'package:tp_bloc/models/product.dart';

class ProductRepository {
	String endpoint = 'https://fakestoreapi.com/products?sort=desc&limit=10';
	Future<List<ProductModel>>getProducts() async {
		Response response = await get(Uri.parse(endpoint));
		if(response.statusCode == 200) {
			final List result = jsonDecode(response.body);
			return result.map((e) => ProductModel.fromJson(e)).toList();
		} else {
			throw Exception(response.reasonPhrase);
		}
	}
}