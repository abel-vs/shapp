import 'package:flutter/material.dart';

class ExpandedButton extends StatefulWidget {
  const ExpandedButton({this.text, this.function});

  final String text;
  final Function function;

  @override
  _ExpandedButtonState createState() => _ExpandedButtonState();
}

class _ExpandedButtonState extends State<ExpandedButton> {

  bool loading = false;

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: RaisedButton(
        child: loading
            ? LinearProgressIndicator(
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).canvasColor),
              )
            : Text(
                widget.text,
                style: TextStyle(color: Theme.of(context).canvasColor, fontWeight: FontWeight.bold, fontSize: 20),
              ),
        color: Theme.of(context).primaryColor,
        disabledColor: Colors.grey,
        onPressed: widget.function,
      ),
    );
  }
}
