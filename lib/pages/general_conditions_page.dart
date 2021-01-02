import 'package:flutter/material.dart';
import 'package:shapp/services/app_localizations.dart';

class GeneralConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("general_conditions")),
      ),
      body: SingleChildScrollView(child: Text("Bla bla bla")),
    );
  }
}
