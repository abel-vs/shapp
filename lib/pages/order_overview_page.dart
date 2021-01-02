import 'package:flutter/material.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/services/database.dart';
import 'package:provider/provider.dart';

class OrderOverviewPage extends StatelessWidget {
  final Order order;

  const OrderOverviewPage({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Database database = Provider.of<Database>(context);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).translate("order_overview"))),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  order.state.toReadableString(context),
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline6,
                    children: <TextSpan>[
                      TextSpan(
                          text: order.delivered
                              ? AppLocalizations.of(context).translate("delivered_at") + ": "
                              : AppLocalizations.of(context).translate("delivered_at") + ": "),
                      TextSpan(
                        text: order.deliveryTime.toReadableString(context),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        OrderState.Submitted.toStatusIcon(),
                        size: 40,
                        color: OrderState.Submitted.hasPassed(order.state)
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).disabledColor,
                      ),
                      Icon(
                        OrderState.Collecting.toStatusIcon(),
                        size: 40,
                        color: OrderState.Collecting.hasPassed(order.state)
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).disabledColor,
                      ),
                      Icon(
                        OrderState.Delivering.toStatusIcon(),
                        size: 40,
                        color: OrderState.Delivering.hasPassed(order.state)
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).disabledColor,
                      ),
                      Icon(
                        OrderState.Done.toStatusIcon(),
                        size: 40,
                        color: OrderState.Done.hasPassed(order.state)
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
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                    title: Text(AppLocalizations.of(context).translate("description")),
                    subtitle: Text(order.description),
                    trailing: order.imageReference != null
                        ? InkWell(
                            onTap: () => showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    AlertDialog(content: Image.network(order.imageReference))),
                            borderRadius: BorderRadius.circular(300.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(300.0),
                              child: Image.network(
                                order.imageReference,
                                fit: BoxFit.cover,
                                height: 50,
                                width: 50,
                              ),
                            ),
                          )
                        : Container()),
                order.extraInfo.isNotEmpty
                    ? ListTile(
                        title: Text(AppLocalizations.of(context).translate("extra_info")),
                        subtitle: Text(order.extraInfo),
                      )
                    : Container(),
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
                  title: Text(AppLocalizations.of(context).translate("deposit")),
                  subtitle: Text("€ " + order.estimatedPrice.toStringAsFixed(2)),
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context).translate("delivery_costs")),
                  subtitle: Text("€ " + order.deliveryCosts.toStringAsFixed(2)),
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context).translate("total")),
                  subtitle: Text("€ " + (order.estimatedPrice + order.deliveryCosts).toStringAsFixed(2)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
