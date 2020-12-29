import 'package:flutter/material.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/services/app_localizations.dart';

class OrderOverviewPage extends StatelessWidget {
  final Order order;

  const OrderOverviewPage({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              Text(AppLocalizations.of(context).translate("order_overview"))),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(order.state.toReadableString(context),
                    style: Theme.of(context).textTheme.headline2),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        OrderStatus.Submitted.toStatusIcon(),
                        size: 40,
                        color: OrderStatus.Submitted.hasPassed(order.state)
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).disabledColor,
                      ),
                      Icon(
                        OrderStatus.Collecting.toStatusIcon(),
                        size: 40,
                        color: OrderStatus.Collecting.hasPassed(order.state)
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).disabledColor,
                      ),
                      Icon(
                        OrderStatus.Delivering.toStatusIcon(),
                        size: 40,
                        color: OrderStatus.Delivering.hasPassed(order.state)
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).disabledColor,
                      ),
                      Icon(
                        OrderStatus.Done.toStatusIcon(),
                        size: 40,
                        color: OrderStatus.Done.hasPassed(order.state)
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).disabledColor,
                      ),
                    ],
                  ),
                ),
                LinearProgressIndicator(
                  value: order.state.toPercentage(),
                  backgroundColor: Theme.of(context).disabledColor,
                ),
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title:
                    Text(AppLocalizations.of(context).translate("description")),
                subtitle: Text(order.description),
              ),
              ListTile(
                title:
                    Text(AppLocalizations.of(context).translate("extra_info")),
                subtitle: Text(order.extraInfo),
              ),
              ListTile(
                title: Text(
                    AppLocalizations.of(context).translate("where_to_find")),
                subtitle: Text(order.pickUpLocation),
              ),
              ListTile(
                title: Text(
                    AppLocalizations.of(context).translate("where_to_deliver")),
                subtitle: Text(order.deliveryLocation),
              ),
              ListTile(
                title: Text(
                    AppLocalizations.of(context).translate("when_to_deliver")),
                subtitle: Text(order.deliveryDay.toString() +
                    " " +
                    order.deliveryTime.toString()),
              ),
              ListTile(
                title: Text(AppLocalizations.of(context).translate("deposit")),
                subtitle: Text("€ " + order.estimatedPrice.toStringAsFixed(2)),
              ),
              ListTile(
                title: Text(
                    AppLocalizations.of(context).translate("delivery_costs")),
                subtitle: Text("€ " + order.deliveryCosts.toStringAsFixed(2)),
              ),
              ListTile(
                title: Text(AppLocalizations.of(context).translate("total")),
                subtitle: Text("€ " +
                    (order.estimatedPrice + order.deliveryCosts)
                        .toStringAsFixed(2)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
