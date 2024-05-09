import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/repository_provider.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:flutter_bloc/src/bloc_builder.dart';
import 'package:tp_bloc/bloc/product_bloc.dart';
import 'package:tp_bloc/models/product.dart';
import 'package:tp_bloc/pages/product_page.dart';
// import 'package:tp_bloc/pages/product_page.dart';
import 'package:tp_bloc/repository/repositories.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
        create: (context) => ProductRepository(),
        child: ProductPage(),
      ),
    );
  }

}

