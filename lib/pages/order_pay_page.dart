import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/services/database.dart';
import 'package:shapp/services/payments.dart';
import 'package:shapp/widgets/expanded_button.dart';
import 'package:shapp/widgets/order_title_block.dart';
import 'package:stripe_payment/stripe_payment.dart';

class OrderPayPage extends StatefulWidget {
  @override
  _OrderPayPageState createState() => _OrderPayPageState();
}

class _OrderPayPageState extends State<OrderPayPage> {
  Database database;
  PageController pageController;
  Order order;

  @override
  Widget build(BuildContext context) {
    order = Provider.of<Order>(context);
    pageController = Provider.of<PageController>(context);
    database = Provider.of<Database>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            OrderTitleBlock(
              title: AppLocalizations.of(context).translate("payment"),
              subtitle: AppLocalizations.of(context).translate("payment_subtitle"),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.help),
              color: Theme.of(context).primaryColor,
              iconSize: 30,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(AppLocalizations.of(context).translate("payment_explanation_title"), style: Theme.of(context).textTheme.headline3,),
                    content: Text(AppLocalizations.of(context).translate("payment_explanation")),
                  ),
                );
              },
            ),
            SizedBox(width: 20)
          ],
        ),
        Expanded(
          child: ListView(
            children: [
              ListTile(
                title: Text(AppLocalizations.of(context).translate("order")),
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
                subtitle: Text(order.extraInfo),
              ),
              ListTile(
                title: Text(AppLocalizations.of(context).translate("deposit"), style: Theme.of(context).textTheme.headline5),
                subtitle: Text(
                  "€ " + order.estimatedPrice.toStringAsFixed(2),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                title: Text(AppLocalizations.of(context).translate("delivery_costs"), style: Theme.of(context).textTheme.headline5),
                subtitle: Text(
                  "€ 2,00",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 0,
        ),
        SizedBox(height: 5),
        ListTile(
          title: Text(AppLocalizations.of(context).translate("total"), style: Theme.of(context).textTheme.headline2),
          subtitle: Text(
            "€ " + (order.estimatedPrice + 2).toStringAsFixed(2),
            style: TextStyle(fontSize: 30),
          ),
        ),
        buildButtons(context),
      ],
    );
  }

  Widget buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: double.maxFinite,
        child: Row(
          children: [
            ExpandedButton(
              text: AppLocalizations.of(context).translate("back"),
              function: () {
                pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
              },
            ),
            SizedBox(width: 10),
            ExpandedButton(
              text: AppLocalizations.of(context).translate("pay"),
              function: () => Payments.executePayment(context, order),
            ),
          ],
        ),
      ),
    );
  }
}
