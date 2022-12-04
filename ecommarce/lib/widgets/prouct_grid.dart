import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';
import '../widgets/product_widget.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<ProductProvider>(context).getProduct;
    return (GridView.builder(
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (context, index) => ProductWidget(
            id: productList[index].id,
            title: productList[index].title,
            imageUrl: productList[index].imageUrl)));
  }
}
