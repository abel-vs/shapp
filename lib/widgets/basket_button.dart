import 'package:Shapp/screens/cart_page.dart';
import 'package:flutter/material.dart';

class BasketButton extends StatelessWidget {
  const BasketButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.shopping_basket_outlined),
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => CartPage(),
        ),
      ),
    );
  }
}