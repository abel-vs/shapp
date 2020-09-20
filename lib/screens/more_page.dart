import 'package:Shapp/screens/intro_page.dart';
import 'package:Shapp/screens/settings_page.dart';
import 'package:Shapp/screens/shop_page.dart';
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
      body: ListView(
        children: [
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
            onTap: () => Share.share(
                'Hey! Shoppen was nog nooit zo makkelijk als nu!',
                subject: 'Shapp'),
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Feedback"),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ShopPage(),
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
                builder: (context) => ShopPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
