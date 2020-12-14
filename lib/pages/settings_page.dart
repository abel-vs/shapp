import 'package:flutter/material.dart';
import 'package:shapp/services/app_localizations.dart';

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
        title: Text(AppLocalizations.of(context).translate("settings")),
      ),
      body: ListTileTheme(
        iconColor: Theme.of(context).primaryColor,
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.language,
              ),
              title: Text(AppLocalizations.of(context).translate("language")),
              onTap: () => showDialog(
                context: context,
                builder: (_) => Dialog(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RadioListTile(
                        title: Text(AppLocalizations.of(context).translate("NL")),
                        onChanged: (value){},
                      ),
                      Divider(height: 0),
                      RadioListTile(
                        title: Text(AppLocalizations.of(context).translate("EN")),
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
              title: Text(AppLocalizations.of(context).translate("dark_mode")),
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
              title: Text(AppLocalizations.of(context).translate("notifications")),
            ),
          ],
        ),
      ),
    );
  }
}
