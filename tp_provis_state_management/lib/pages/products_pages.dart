import 'package:flutter/material.dart';
import 'package:tp_provis_state_management/provider/product_provider.dart';
import 'package:tp_provis_state_management/model/product.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final List<Product> productsModel =
        Provider.of<ProductDataProvider>(context).productData;

    if (productsModel.isEmpty) {
      Provider.of<ProductDataProvider>(context, listen: false).fetchData();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Data Product'),
      ),
      body: Consumer<ProductDataProvider>(
        builder: (context, productModel, _) {
          if (productsModel.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SafeArea(
              child: ListView.builder(
                itemCount: productsModel.length,
                itemBuilder: (context, index) {
                  final product = productsModel[index];
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
        },
      ),
    );
  }
}
