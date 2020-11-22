import 'package:flutter/material.dart';

class ExpandedButton extends StatelessWidget {
  const ExpandedButton({this.text, this.function});

  final String text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RaisedButton(
        child: Text(
          text,
          style: TextStyle(color: Theme.of(context).canvasColor, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        color: Theme.of(context).primaryColor,
        disabledColor: Colors.grey,
        onPressed: function,
      ),
    );
  }
}