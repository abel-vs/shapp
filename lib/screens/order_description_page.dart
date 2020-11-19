import 'package:flutter/material.dart';

class OrderDescriptionPage extends StatefulWidget {
  @override
  _OrderDescriptionPageState createState() => _OrderDescriptionPageState();

  final PageController pageController;
  final TextEditingController descriptionController;

  OrderDescriptionPage({this.pageController, this.descriptionController});
}

class _OrderDescriptionPageState extends State<OrderDescriptionPage> {
  @override
  void initState() {
    widget.descriptionController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Wat heb je nodig?",
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 5),
          Text("Beschrijf het hier en we gaan het voor je halen!"),
          SizedBox(height: 20),
          Expanded(
            child: TextField(
              textAlignVertical: TextAlignVertical.top,
              controller: widget.descriptionController,
              decoration: InputDecoration(
                labelText: "Beschrijving",
//                labelStyle: TextStyle(fontSize: 20),
                hintText: "",
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.all(20.0),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.multiline,
              expands: true,
              maxLines: null,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.maxFinite,
            child: RaisedButton(
              child: Text(
                "Volgende",
                style: TextStyle(color: Theme.of(context).canvasColor, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              color: Theme.of(context).primaryColor,
              disabledColor: Colors.grey,
              onPressed: widget.descriptionController.text.isEmpty
                  ? null
                  : () =>
                      widget.pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut),
            ),
          ),
        ],
      ),
    );
  }
}
