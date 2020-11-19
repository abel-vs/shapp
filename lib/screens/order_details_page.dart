import 'package:flutter/material.dart';

class OrderDetailsPage extends StatefulWidget {
  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();

  final PageController pageController;
  final TextEditingController timeController;

  OrderDetailsPage({this.pageController, this.timeController});
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
          TextField(
            decoration: InputDecoration(
              labelText: "Waar te vinden",
              hintText: "Waar kunnen we dit product voor je vinden?",
              alignLabelWithHint: true,
              contentPadding: EdgeInsets.all(20.0),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            onTap: () async {
              showDialog(
                  context: context,
                  builder: (_) => Dialog(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text("Zo snel mogelijk"),
                              onTap: () {
                                Navigator.of(context).pop();
                                return "Yeet";
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
            autofocus: false,
            decoration: InputDecoration(
              labelText: "Wanneer",
              alignLabelWithHint: true,
              contentPadding: EdgeInsets.all(20.0),
              border: OutlineInputBorder(),
            ),
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
}
