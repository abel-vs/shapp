import 'package:flutter/material.dart';

InputDecoration fieldDecoration({labelText, hintText}) => InputDecoration(
      labelText: labelText,
      hintText: hintText,
      alignLabelWithHint: true,
      contentPadding: EdgeInsets.all(20.0),
      border: OutlineInputBorder(),
);
