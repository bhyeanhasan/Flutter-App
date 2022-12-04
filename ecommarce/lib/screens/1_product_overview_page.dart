import 'package:flutter/material.dart';
import '../model/product.dart';
import '../widgets/product_widget.dart';
import '../widgets/prouct_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: ProductGrid(),
    );
  }
}
