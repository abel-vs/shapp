import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/decorations/field_decoration.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/widgets/expanded_button.dart';
import 'package:shapp/widgets/order_title_block.dart';

class OrderDetailsPage extends StatefulWidget {
  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  PageController pageController;
  Order order;
  final TextEditingController timeController = TextEditingController();
  final TextEditingController dayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    order = Provider.of<Order>(context);
    pageController = Provider.of<PageController>(context);
    dayController.text = order.deliveryDay.toReadableString();
    timeController.text = order.deliveryTime.toReadableString(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderTitleBlock(
          title: "Details",
          subtitle: "Alle informatie voor een vlotte levering.",
        ),
        buildFields(context),
        buildButtons(context),
      ],
    );
  }

  Widget buildFields(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    buildPickUpLocationField(),
                    SizedBox(height: 10),
                    buildDeliveryLocationField(),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        buildDayField(context),
                        SizedBox(width: 10),
                        buildTimeField(context),
                      ],
                    ),
                    SizedBox(height: 10),
                    buildPriceField(context),
                    SizedBox(height: 10),
                    buildExtraInfoField(),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildExtraInfoField() {
    return Expanded(
      child: TextFormField(
        textAlignVertical: TextAlignVertical.top,
        decoration: fieldDecoration(labelText: "Verdere Informatie"),
        keyboardType: TextInputType.multiline,
        minLines: null,
        maxLines: null,
        expands: true,
        onChanged: (text) => setState(() => order.extraInfo = text),
        initialValue: order.extraInfo,
      ),
    );
  }

  InputDecorator buildPriceField(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: "Prijs",
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 10),
        border: OutlineInputBorder(),
      ),
      child: Row(
        children: [
          Text("Ongeveer €" + order.estimatedPrice.toStringAsFixed(0)),
          Expanded(
            child: Slider(
                value: order.estimatedPrice,
                onChanged: (price) => setState(() => order.estimatedPrice = price),
                min: 10,
                max: 50,
                divisions: 4,
                label: '€${order.estimatedPrice.toStringAsFixed(0)}'),
          ),
        ],
      ),
    );
  }

  Widget buildTimeField(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onTap: () {
          showDialog(
              context: context,
              builder: (_) => Dialog(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text("Zo snel mogelijk"),
                          onTap: () {
                            order.deliveryTime = TimeExtension.asap();
                            timeController.text = order.deliveryTime.toReadableString(context);
                            Navigator.of(context).pop();
                          },
                        ),
                        Divider(height: 0),
                        ListTile(
                          title: Text("Kies een ander tijdstip"),
                          onTap: () async {
                            TimeOfDay time = await showTimePicker(
                              context: context,
                              initialTime: TimeExtension.asap(),
                            );
                            order.deliveryTime = time;
                            timeController.text = order.deliveryTime.toReadableString(context);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ));
        },
        readOnly: true,
        controller: timeController,
        decoration: fieldDecoration(labelText: "Tijdstip"),
      ),
    );
  }

  Widget buildDayField(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onTap: () async {
          DateTime day = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 7)),
          );
          if (day != null) {
            order.deliveryDay = day;
            dayController.text = day.toReadableString();
          }
        },
        readOnly: true,
        controller: dayController,
        decoration: fieldDecoration(labelText: "Dag"),
      ),
    );
  }

  Widget buildPickUpLocationField() {
    return TextFormField(
      // onTap: () => Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => MapPage(),
      //   ),
      // ),
      onChanged: (text) => setState(() => order.pickUpLocation = text),
      // readOnly: true,
      initialValue: order.pickUpLocation.toString(),
      decoration: fieldDecoration(labelText: "Waar te vinden", hintText: "Waar kunnen we dit product voor je vinden?"),
    );
  }

  Widget buildDeliveryLocationField() {
    return TextFormField(
      // onTap: () => Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => MapPage(),
      //   ),
      // ),
      onChanged: (text) => setState(() => order.deliveryLocation = text),
      // readOnly: true,
      initialValue: order.deliveryLocation.toString(),
      decoration: fieldDecoration(labelText: "Waar te leveren", hintText: "Waar wil je je bestelling geleverd hebben?"),
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
              text: "Volgende",
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
