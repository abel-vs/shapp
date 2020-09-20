import 'package:Shapp/screens/intro_page.dart';
import 'package:Shapp/screens/settings_page.dart';
import 'package:Shapp/screens/shops_page.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meer"),
      ),
      body: ListTileTheme(
        iconColor: Theme.of(context).primaryColor,
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.help,
              ),
              title: Text("Hoe te gebruiken"),
              onTap: () => Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (context) => IntroPage(),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.share,
              ),
              title: Text("Spread the love"),
              onTap: () => Share.share('Hey! Shoppen was nog nooit zo makkelijk als nu!',
                  subject: 'Shapp'),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: Text("Instellingen"),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: Text("Winkels"),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ShopsPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
