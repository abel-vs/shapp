import 'package:flutter/material.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/services/app_localizations.dart';

class OrderOverviewPage extends StatelessWidget {
  final Order order;

  const OrderOverviewPage({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).translate("order_overview"))),
      body: ListView(
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context).translate("description")),
            subtitle: Text(order.description),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context).translate("where_to_find")),
            subtitle: Text(order.pickUpLocation),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context).translate("where_to_deliver")),
            subtitle: Text(order.deliveryLocation),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context).translate("when_to_deliver")),
            subtitle: Text(order.deliveryDay.toString() + " " + order.deliveryTime.toString()),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context).translate("extra_info")),
            subtitle: Text(order.description),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context).translate("deposit")),
            subtitle: Text("€ " + order.estimatedPrice.toStringAsFixed(2)),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context).translate("delivery_costs")),
            subtitle: Text("€ 2,00"),
          ),
        ],
      ),
    );
  }
}
