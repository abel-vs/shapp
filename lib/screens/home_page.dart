import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/screens/more_page.dart';
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
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent, centerTitle: true, title: Text("Shapp"),),
      drawer: Drawer(child: MorePage()),
      body: Center(
        child: FloatingActionButton(
          onPressed: () => log('Yeet'),
          child: Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
