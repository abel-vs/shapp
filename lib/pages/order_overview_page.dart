import 'package:flutter/material.dart';
import 'package:shapp/models/order.dart';

class OrderOverviewPage extends StatelessWidget {
  final Order order;

  const OrderOverviewPage({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bestellingsoverzicht")),
      body: ListView(
        children: [
          ListTile(
            title: Text("Beschrijving"),
            subtitle: Text(order.description),
          ),
          ListTile(
            title: Text("Waar te vinden"),
            subtitle: Text(order.pickUpLocation),
          ),
          ListTile(
            title: Text("Waar te leveren"),
            subtitle: Text(order.deliveryLocation),
          ),
          ListTile(
            title: Text("Wanneer te leveren"),
            subtitle: Text(order.deliveryDay.toString() + " " + order.deliveryTime.toString()),
          ),
          ListTile(
            title: Text("Verdere Informatie"),
            subtitle: Text(order.description),
          ),
          ListTile(
            title: Text("Voorschot"),
            subtitle: Text("€ " + order.estimatedPrice.toStringAsFixed(2)),
          ),
          ListTile(
            title: Text("Leveringskosten"),
            subtitle: Text("€ 2,00"),
          ),
        ],
      ),
    );
  }
}
