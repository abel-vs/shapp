import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/services/database.dart';
import 'package:shapp/services/payments.dart';
import 'package:shapp/widgets/expanded_button.dart';
import 'package:shapp/widgets/order_title_block.dart';
import 'package:stripe_payment/stripe_payment.dart';

import 'order_confirmed_page.dart';

class OrderPayPage extends StatefulWidget {
  @override
  _OrderPayPageState createState() => _OrderPayPageState();
}

class _OrderPayPageState extends State<OrderPayPage> {
  Database database;
  PageController pageController;
  Order order;

  PaymentIntentResult _paymentIntent;
  Token _paymentToken;
  Source _source;

  ScrollController _controller = ScrollController();

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
              title: "Betaling",
              subtitle: "Kijk je bestelling nog eens na en betaal!",
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.help),
              color: Theme.of(context).primaryColor,
              iconSize: 30,
              onPressed: () {
                showDialog(
                  context: context,
                  child: AlertDialog(
                    title: Text("Hoe werkt het betalen?", style: Theme.of(context).textTheme.headline3,),
                    content: Text("Je betaalt een voorschot voor de producten die je laat leveren.\n\n"
                        "Het verschil in prijs wordt bij de levering afgehandeld.\n\n"
                        "Als je voorschot te veel was krijg je de rest terug.\n\n"
                        "Als je voorschot te weinig was betaal je het overige bij de levering.\n\n"
                        "Als de werkelijke prijs te hard afwijkt wordt je nog gecontacteerd voor we de aankoop maken."),
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
                title: Text("Voorschot", style: Theme.of(context).textTheme.headline5),
                subtitle: Text(
                  "€ " + order.estimatedPrice.toStringAsFixed(2),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ListTile(
                title: Text("Leveringskosten", style: Theme.of(context).textTheme.headline5),
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
          title: Text("Totaal", style: Theme.of(context).textTheme.headline2),
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
              text: "Terug",
              function: () {
                pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
              },
            ),
            SizedBox(width: 10),
            ExpandedButton(
              text: "Betaal",
              function: () => Payments.executePayment(context, order),
            ),
          ],
        ),
      ),
    );
  }
}
