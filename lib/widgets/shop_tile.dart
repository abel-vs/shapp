import 'package:flutter/material.dart';

class ShopTile extends StatelessWidget {

  final String title;
  final String image;

  const ShopTile({
    Key key,
    this.title,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Flexible(
                child: Image(
                  image: AssetImage(this.image),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(this.title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}