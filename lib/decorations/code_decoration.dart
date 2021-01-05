import 'package:code_input/code_input.dart';
import 'package:flutter/material.dart';

CodeInputBuilder codeDecoration(BuildContext context) => CodeInputBuilders.containerized(
      totalSize: Size.fromRadius(30),
      emptySize: Size.fromRadius(10),
      filledSize: Size.fromRadius(25),
      emptyDecoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Theme.of(context).primaryColor, width: 2.0),
        color: Theme.of(context).canvasColor,
      ),
      filledDecoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Theme.of(context).primaryColor, width: 3.0),
        color: Theme.of(context).primaryColor,
      ),
      emptyTextStyle: TextStyle(
        color: Theme.of(context).canvasColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      filledTextStyle: TextStyle(
        color: Theme.of(context).canvasColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
