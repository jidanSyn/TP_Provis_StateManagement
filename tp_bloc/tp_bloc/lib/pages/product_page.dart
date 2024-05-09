
import 'package:flutter/material.dart';

import 'package:flutter_bloc/src/repository_provider.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:flutter_bloc/src/bloc_builder.dart';

import 'package:tp_bloc/repository/repositories.dart';
import 'package:tp_bloc/bloc/product_bloc.dart';
import 'package:tp_bloc/models/product.dart';


class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(
        RepositoryProvider.of<ProductRepository>(context),
      )..add(LoadProductEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Data Product"),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if(state is ProductInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if(state is ProductLoaded) {
              // return Center(child: Text("Product Loaded"),);
              List<ProductModel> products = state.products;

              return SafeArea(
                  child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Card(
                      color: Colors.indigo[50],
                      elevation: 4,
                      margin: EdgeInsets.all(16),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              product.image,
                            ),
                            SizedBox(height: 16),
                            Text(
                              "${product.title}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Harga: ${product.price}',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Jenis: ${product.category}',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
