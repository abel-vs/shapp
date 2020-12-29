import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {

  final String title;
  final String content;


  InfoDialog({this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title,
        style: Theme.of(context).textTheme.headline3,
      ),
      content: Text(content)
    );
  }
}
