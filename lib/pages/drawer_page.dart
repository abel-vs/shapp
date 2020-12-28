import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shapp/pages/about_page.dart';
import 'package:shapp/pages/feedback_page.dart';
import 'package:shapp/pages/intro_page.dart';
import 'package:shapp/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/services/auth.dart';
import 'package:shapp/themes.dart';
import 'package:share/share.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of<AuthBase>(context);

    return Drawer(
      child: ListTileTheme(
        iconColor: Theme.of(context).primaryColor,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Shapp'),
            automaticallyImplyLeading: false,
          ),
          body: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(AppLocalizations.of(context).translate("settings")),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text(
                    AppLocalizations.of(context).translate("spread_the_love")),
                onTap: () => Share.share(
                    AppLocalizations.of(context).translate("share_message"),
                    subject: 'Shapp'),
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text(AppLocalizations.of(context).translate("feedback")),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FeedbackPage(),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.help_outline),
                title: Text(AppLocalizations.of(context)
                    .translate("frequent_questions")),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(title: Text("Hoe te gebruiken")),
                      body: IntroPage(),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.info_outline),
                title:
                    Text(AppLocalizations.of(context).translate("about_app")),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AboutPage(),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                ),
                title: Text(
                  AppLocalizations.of(context).translate("logout"),
                  style: TextStyle(color: TERRA_COTTA_RED),
                ),
                onTap: () => auth.signOut(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
