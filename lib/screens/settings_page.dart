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
            ListTile(
              leading: Icon(
                Icons.info_outline,
              ),
              title: Text("Over de app"),
            ),
          ],
        ),
      ),
    );
  }
}
