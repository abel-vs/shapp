import 'package:flutter/material.dart';
import 'package:shapp/widgets/expanded_button.dart';
import 'package:shapp/widgets/order_title_block.dart';

class OrderSummaryPage extends StatefulWidget {
  @override
  _OrderSummaryPageState createState() => _OrderSummaryPageState();

  final PageController controller;

  OrderSummaryPage(this.controller);
}

class _OrderSummaryPageState extends State<OrderSummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderTitleBlock(
          title: "Overzicht",
          subtitle: "Kijk je bestelling nog eens na en betaal!",
        ),
        Expanded(
          child: ListView(
//            padding: EdgeInsets.symmetric(horizontal: 10),
            children: [
              ListTile(
                title: Text("Beschrijving"),
                subtitle: Text("Yeet"),
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
                widget.controller.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
              },
            ),
            SizedBox(width: 10),
            ExpandedButton(
              text:  "Volgende",
              function: () {
                widget.controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
              },
            ),
          ],
        ),
      ),
    );
  }
}
