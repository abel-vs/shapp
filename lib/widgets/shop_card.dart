import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 300,
        color: Colors.white,
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Albert Heijn",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
      elevation: 4,
    );
  }
}
