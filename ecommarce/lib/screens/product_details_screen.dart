import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/product_provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments.toString();
    var product =
        Provider.of<ProductProvider>(context, listen: false).findById(id!);

    return Scaffold(
        appBar: AppBar(
          title: Text(product.title),
        ),
        body: Text("Details"));
  }
}
