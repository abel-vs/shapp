import 'package:flutter/material.dart';
import 'package:shapp/models/product.dart';
import 'package:shapp/widgets/product_card.dart';

class ProductListView extends StatelessWidget {
  ProductListView({this.products});

  final Stream<List<Stream<Product>>> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: StreamBuilder<List<Stream<Product>>>(
        stream: products, // Stream of the list of products
        builder: (context, snapshot) => snapshot.hasData
            ? ListView(
                scrollDirection: Axis.horizontal,
                children: snapshot.data // List<Stream<Product>>
                    .map((productStream) => StreamBuilder(
                        stream: productStream.asBroadcastStream(),
                        builder: (context, snapshot) =>
                            snapshot.hasData ? ProductCard(product: snapshot.data) : Container()))
                    .toList(),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
