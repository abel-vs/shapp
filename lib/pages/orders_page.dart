import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/models/order.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bestellingen"),
      ),
      body: Consumer<List<Order>>(
        builder: (context, List<Order> orders, _) => ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) => Text(orders.elementAt(index).description),
        ),
      ),
    );
  }
}
