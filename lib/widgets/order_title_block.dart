import 'package:flutter/material.dart';

class OrderTitleBlock extends StatelessWidget {
  final String title;
  final String subtitle;

  const OrderTitleBlock({
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 5),
          Text(subtitle),
        ],
      ),
    );
  }
}