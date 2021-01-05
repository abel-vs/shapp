import 'package:flutter/material.dart';

class ExpandedButton extends StatefulWidget {
  const ExpandedButton({this.text, this.function, this.loading = false});

  final String text;
  final Function function;
  final bool loading;

  @override
  _ExpandedButtonState createState() => _ExpandedButtonState();
}

class _ExpandedButtonState extends State<ExpandedButton> {

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: RaisedButton(
        child: widget.loading
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
