import 'package:shapp/services/app_localizations.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate("about_app"),
        ),
      ),
      body: ListView(
        children: [
          ListTile(title: Text(AppLocalizations.of(context).translate("app_version"))),
          ListTile(title: Text(AppLocalizations.of(context).translate("general_conditions"))),
          ListTile(title: Text(AppLocalizations.of(context).translate("privacy_policy"))),
          ListTile(title: Text(AppLocalizations.of(context).translate("cookie_policy"))),
        ],
      )
    );
  }
}
