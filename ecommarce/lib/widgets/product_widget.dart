import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const ProductWidget(
      {required this.id, required this.title, required this.imageUrl});

  void gotoDetailsPage(context) {
    Navigator.of(context).pushNamed('/product_details', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => gotoDetailsPage(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
          footer: GridTileBar(
              backgroundColor: Colors.black54,
              leading: Icon(
                Icons.favorite,
                color: Theme.of(context).primaryColor,
              ),
              trailing: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                title,
                textAlign: TextAlign.center,
              )),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
