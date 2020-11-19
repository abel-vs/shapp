import 'package:flutter/cupertino.dart';
import 'package:shapp/screens/about_page.dart';
import 'package:shapp/screens/feedback_page.dart';
import 'package:shapp/screens/intro_page.dart';
import 'package:shapp/screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListTileTheme(
        iconColor: Theme.of(context).primaryColor,
        child: ListView(
          children: [
            AppBar(
              title: Text('Shapp'),
              automaticallyImplyLeading: false,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Instellingen"),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("Spread the love"),
              onTap: () => Share.share('Hey! Shoppen was nog nooit zo makkelijk als nu!', subject: 'Shapp'),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Feedback"),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FeedbackPage(),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text("Veelgestelde vragen"),
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
              title: Text("Over de app"),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AboutPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
