import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instellingen"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(
              Icons.language,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("Taal"),
          ),
          ListTile(
            leading: Icon(
              Icons.wb_sunny,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("Donkere Modus"),
            trailing: Switch(
              value: false,

            ),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("Meldingen"),
          ),
          ListTile(
            leading: Icon(
              Icons.info_outline,
              color: Theme.of(context).primaryColor,
            ),
            title: Text("Over de app"),
          ),
        ],
      ),
    );
  }
}
