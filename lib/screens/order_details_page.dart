import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Details",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 5),
          Text("Beschrijf het hier en we gaan het voor je halen!"),
          SizedBox(height: 20),
          buildPickUpPlaceField(),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
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
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: "Dag",
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.all(20.0),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
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
                                      TimeOfDay time =
                                          await showTimePicker(context: context, initialTime: TimeOfDay.now());
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
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: "Tijdstip",
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.all(20.0),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
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
          Spacer(),
          SizedBox(
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
                      if (!(widget.pageController.page == 2.0))
                        widget.pageController
                            .previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: RaisedButton(
                    child: Text(
                      "Volgende",
                      style: TextStyle(color: Theme.of(context).canvasColor, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      if (!(widget.pageController.page == 2.0))
                        widget.pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextField buildPickUpPlaceField() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Waar te vinden",
        hintText: "Waar kunnen we dit product voor je vinden?",
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.all(20.0),
        border: OutlineInputBorder(),
      ),
    );
  }
}
