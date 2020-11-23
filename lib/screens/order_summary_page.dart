import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/widgets/expanded_button.dart';
import 'package:shapp/widgets/order_title_block.dart';

class OrderSummaryPage extends StatefulWidget {
  @override
  _OrderSummaryPageState createState() => _OrderSummaryPageState();
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {

  PageController pageController;
  Order order;

  @override
  Widget build(BuildContext context) {
    order = Provider.of<Order>(context);
    pageController = Provider.of<PageController>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderTitleBlock(
          title: "Overzicht",
          subtitle: "Kijk je bestelling nog eens na en betaal!",
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
                title: Text("Prijs"),
                subtitle: Text(order.estimatedPrice.toString()),
              ),
            ],
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
              text:  "Volgende",
              function: () {
                pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
              },
            ),
          ],
        ),
      ),
    );
  }
}
