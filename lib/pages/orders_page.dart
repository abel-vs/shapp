import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/widgets/order_card.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("orders")),
      ),
      body: Consumer<List<Order>>(
        builder: (context, List<Order> orders, _) => orders == null
            ? Center(child: CircularProgressIndicator())
            : orders.length == 0
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sentiment_dissatisfied_sharp,
                            size: 150, color: Theme.of(context).primaryColor),
                        SizedBox(height: 20),
                        Text(
                          AppLocalizations.of(context).translate("no_orders"),
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(height: kToolbarHeight),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: orders.length,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    itemBuilder: (context, index) =>
                        OrderCard(order: orders.elementAt(index)),
                  ),
      ),
    );
  }
}
