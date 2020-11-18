import 'package:flutter/cupertino.dart';
import 'package:shapp/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Stack(
          children: [
            Container(
              width: 150,
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    child: buildImage(),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.bottomLeft,
                      child: buildInfo(context),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                icon: Icon(
                  Icons.favorite_outline,
                  color: Theme.of(context).primaryColor,
                ),
                splashColor: Colors.transparent,
                onPressed: () => print("Favorite"),
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

  Column buildInfo(BuildContext context) {
    List<String> price = product.price.toStringAsFixed(2).split(".");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.brand == null ? "brand" : product.brand,
          style: Theme.of(context).textTheme.bodyText1,
          maxLines: 1,
        ),
        Text(
          product.name,
          style: Theme.of(context).textTheme.headline6,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        Spacer(),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.headline2,
            children: [
              TextSpan(text: price.first),
              TextSpan(text: ","),
              TextSpan(text: price.last, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ],
    );
  }

  ClipRRect buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
      child: Image.network(
        product.image,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          return progress == null ? child : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
