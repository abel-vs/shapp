import 'package:flutter/material.dart';

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
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Overzicht",
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 5),
              Text("Kijk je bestelling nog eens na en betaal!"),
            ],
          ),
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
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
                  child: RaisedButton(
                    child: Text(
                      "Terug",
                      style: TextStyle(color: Theme.of(context).canvasColor, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      widget.controller.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: RaisedButton(
                    child: Text(
                      "Betaal",
                      style: TextStyle(color: Theme.of(context).canvasColor, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      widget.controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
