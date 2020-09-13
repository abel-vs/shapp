import 'package:Shapp/screens/intro_page.dart';
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
        ],
      ),
    );
  }
}
