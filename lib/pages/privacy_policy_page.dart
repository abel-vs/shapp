import 'package:flutter/material.dart';
import 'package:shapp/services/app_localizations.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("privacy_policy")),
      ),
      body: SingleChildScrollView(child: Text("Bla bla bla")),
    );
  }
}
