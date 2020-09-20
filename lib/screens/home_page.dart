import 'package:Shapp/screens/map_page.dart';
import 'package:Shapp/screens/search_page.dart';
import 'package:Shapp/services/app_localizations.dart';
import 'package:Shapp/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shapp"),
        actions: [IconButton(icon: Icon(Icons.shopping_basket_outlined), onPressed: () => print("Yeet"), )],
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SearchBar(),
          ),
        ],
      ),
//      backgroundColor:,
    );
  }
}
