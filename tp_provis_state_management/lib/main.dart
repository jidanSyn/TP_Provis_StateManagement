import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_provis_state_management/provider/product_provider.dart';
import 'package:tp_provis_state_management/pages/products_pages.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ProductDataProvider>(
      create: (context) => ProductDataProvider(),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
