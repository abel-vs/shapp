import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/screens/drawer_page.dart';
import 'package:shapp/services/database.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Shapp"),
      ),
      drawer: Drawer(child: DrawerPage()),
      body: Center(
        child: Container(
            width: 200.0,
            height: 200.0,
            child: new RawMaterialButton(
              shape: new CircleBorder(),
              fillColor: Theme.of(context).primaryColor,
              splashColor: Theme.of(context).canvasColor.withOpacity(0.6),
              highlightColor: Theme.of(context).canvasColor.withOpacity(0.1),
              elevation: 20,
              child: Icon(
                Icons.shopping_basket,
                color: Theme.of(context).canvasColor,
                size: 100,
              ),
              onPressed: () {},
            )),
      ),
    );
  }
}
