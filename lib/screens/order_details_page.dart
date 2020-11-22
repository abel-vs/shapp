import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shapp/screens/map_page.dart';
import 'package:shapp/widgets/expanded_button.dart';
import 'package:shapp/widgets/order_title_block.dart';

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return this.year == other.year && this.month == other.month && this.day == other.day;
  }
}

class OrderDetailsPage extends StatefulWidget {
  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();

  final PageController pageController;
  final TextEditingController timeController;
  final TextEditingController dayController;

  OrderDetailsPage({this.pageController, this.timeController, this.dayController});
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderTitleBlock(
          title: "Details",
          subtitle: "Beschrijf het hier en we gaan het voor je halen!",
        ),
        buildFields(context),
        Spacer(),
        buildButtons(context),
      ],
    );
  }

  Padding buildFields(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            buildPickUpPlaceField(),
            SizedBox(height: 10),
            Row(
              children: [
                buildDayField(context),
                SizedBox(width: 10),
                buildTimeField(context),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: "Beschrijving",
                hintText: "",
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.all(20.0),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      );
  }

  Widget buildTimeField(BuildContext context) {
    return Expanded(
      child: TextField(
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
                            widget.timeController.text = "Zo snel mogelijk";
                            Navigator.of(context).pop();
                          },
                        ),
                        Divider(height: 0),
                        ListTile(
                          title: Text("Kies een ander tijdstip"),
                          onTap: () async {
                            TimeOfDay time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                            widget.timeController.text = time.format(context);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ));
        },
        readOnly: true,
        controller: widget.timeController,
        decoration: InputDecoration(
          labelText: "Tijdstip",
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.all(20.0),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildDayField(BuildContext context) {
    return Expanded(
      child: TextField(
        onTap: () async {
          DateTime day = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 7)),
          );
          widget.dayController.text = day.isSameDate(DateTime.now())
              ? "Vandaag"
              : day.isSameDate(DateTime.now().add(Duration(days: 1)))
                  ? "Morgen"
                  : DateFormat('dd-MM-yyyy').format(day);
        },
        readOnly: true,
        controller: widget.dayController,
        decoration: InputDecoration(
          labelText: "Dag",
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.all(20.0),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  TextField buildPickUpPlaceField() {
    return TextField(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MapPage(),
        ),
      ),
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Waar te vinden",
        hintText: "Waar kunnen we dit product voor je vinden?",
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.all(20.0),
        border: OutlineInputBorder(),
      ),
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
                widget.pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
              },
            ),
            SizedBox(width: 10),
            ExpandedButton(
              text: "Volgende",
              function: () {
                widget.pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
              },
            ),
          ],
        ),
      ),
    );
  }
}
