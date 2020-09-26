import 'package:Shapp/services/app_localizations.dart';
import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate("feedback"))),
      body: Center(child: Text("Rate us or whatever"),),
    );
  }
}
