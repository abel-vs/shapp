import 'package:Shapp/screens/intro_page.dart';
import 'package:Shapp/screens/settings_page.dart';
import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meer"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(
              Icons.help,
              color: Colors.black,
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
              color: Colors.black,
            ),
            title: Text("Spread the love"),
            onTap: () => print("Share"),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            title: Text("Instellingen"),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SettingsPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
