import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/services/auth.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool darkMode = true;

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
                builder: (_) => Dialog(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RadioListTile(
                        title: Text("Nederlands"),
                        onChanged: (value){},
                      ),
                      Divider(height: 0),
                      RadioListTile(
                        title: Text("Engels"),
                        onChanged: (value){},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.wb_sunny,
              ),
              title: Text("Donkere Modus"),
              trailing: Switch(
                onChanged: (value) => this.setState(() {
                  darkMode = value;
                }),
                value: darkMode,
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
