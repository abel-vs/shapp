import 'package:Shapp/screens/about_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instellingen"),
      ),
      body: ListTileTheme(
        iconColor: Theme.of(context).primaryColor,
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.language,
              ),
              title: Text("Taal"),
              onTap: () => showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text("Check 123"),
                  content: Text("Choose your damn language mate"),
                  actions: [
                    FlatButton(
                      onPressed: () =>
                          Navigator.of(context, rootNavigator: true).pop(),
                      child: Text("Cancel"),
                    ),
                    FlatButton(
                      onPressed: () =>
                          Navigator.of(context, rootNavigator: true).pop(),
                      child: Text("Confirm"),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.wb_sunny,
              ),
              title: Text("Donkere Modus"),
              trailing: Switch(
                value: false,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
              ),
              title: Text("Meldingen"),
            ),
          ],
        ),
      ),
    );
  }
}
