import 'package:shapp/models/product.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 2,
        child: Column(
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                child: product.image,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.brand == null ? "brand" : product.brand,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    "€ " + product.price.toString(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
      borderRadius: BorderRadius.all(const Radius.circular(5.0)),
      splashColor: Theme.of(context).primaryColor,
    );
  }
}
