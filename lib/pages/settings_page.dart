import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String darkMode;
  SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    prefs = Provider.of<SharedPreferences>(context);
    darkMode = prefs.get("dark_mode");

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
                        onChanged: (value) {},
                      ),
                      Divider(height: 0),
                      RadioListTile(
                        title: Text(AppLocalizations.of(context).translate("EN")),
                        onChanged: (value) {},
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
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => buildDarkModeDialog(context),
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

  void onDarkModeChanged(String value) {
    darkMode = value;
    prefs.setString("dark_mode", value);
    prefs.reload();
    print("Setting Dark Mode: " + value.toString());
  }

  Dialog buildDarkModeDialog(BuildContext context) {
    return Dialog(
      child: StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile(
              title: Text(AppLocalizations.of(context).translate("dark")),
              value: "DARK",
              groupValue: darkMode,
              onChanged: (value) => setState(() {
                onDarkModeChanged(value);
              }),
            ),
            Divider(height: 0),
            RadioListTile(
              title: Text(AppLocalizations.of(context).translate("light")),
              value: "LIGHT",
              groupValue: darkMode,
              onChanged: (value) => setState(() {
                onDarkModeChanged(value);
              }),
            ),
            Divider(height: 0),
            RadioListTile(
              title: Text(AppLocalizations.of(context).translate("system")),
              value: "SYSTEM",
              groupValue: darkMode,
              onChanged: (value) => setState(() {
                onDarkModeChanged(value);
              }),
            ),
          ],
        );
      }),
    );
  }
}