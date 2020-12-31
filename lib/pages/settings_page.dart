import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/services/preferences_provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  PreferencesProvider preferences;

  @override
  Widget build(BuildContext context) {
    preferences = Provider.of<PreferencesProvider>(context);

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
                builder: (context) => buildLanguageDialog(context),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.wb_sunny,
              ),
              title: Text(AppLocalizations.of(context).translate("dark_mode")),
              onTap: () => showDialog(
                context: context,
                builder: (context) => buildDarkModeDialog(context),
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

  Dialog buildLanguageDialog(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile(
            title: Text(AppLocalizations.of(context).translate("NL")),
            value: "nl",
            groupValue: preferences.language,
            onChanged: (value) => setState(() => preferences.language = value),
          ),
          Divider(height: 0),
          RadioListTile(
            title: Text(AppLocalizations.of(context).translate("EN")),
            value: "en",
            groupValue: preferences.language,
            onChanged: (value) => setState(() => preferences.language = value),
          ),
          Divider(height: 0),
          RadioListTile(
            title: Text(AppLocalizations.of(context).translate("system")),
            value: "SYSTEM",
            groupValue: preferences.language,
            onChanged: (value) => setState(() => preferences.language = value),
          ),
        ],
      ),
    );
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
              groupValue: preferences.themeMode,
              onChanged: (value) => setState(() => preferences.themeMode = value),
            ),
            Divider(height: 0),
            RadioListTile(
              title: Text(AppLocalizations.of(context).translate("light")),
              value: "LIGHT",
              groupValue: preferences.themeMode,
              onChanged: (value) => setState(() => preferences.themeMode = value),
            ),
            Divider(height: 0),
            RadioListTile(
              title: Text(AppLocalizations.of(context).translate("system")),
              value: "SYSTEM",
              groupValue: preferences.themeMode,
              onChanged: (value) => setState(() => preferences.themeMode = value),
            ),
          ],
        );
      }),
    );
  }
}
