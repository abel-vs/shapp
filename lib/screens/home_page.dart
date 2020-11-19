import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/screens/drawer_page.dart';
import 'package:shapp/screens/order_page.dart';
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
        centerTitle: true,
        title: FlatButton(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Delft",
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
          onPressed: () => showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text(
                "Kies je locatie",
                style: Theme.of(context).textTheme.headline2,
              ),
              contentPadding: EdgeInsets.only(top: 20),
              content: Container(
                width: double.maxFinite,
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text("Momenteel zijn we enkel actief in Delft."),
                    ),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        RadioListTile(
                          value: false,
//                          controlAffinity: ListTileControlAffinity.trailing,
                          contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
                          title: Text("Huidige Locatie"),
                          onChanged: (value) {},
                        ),
                        Divider(height: 0,),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 24.0),
                          leading: Icon(Icons.add),
                          title: Text("Voeg ander adres toe"),
                          onTap: (){},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
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
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OrderPage(),
                ),
              ),
            )),
      ),
    );
  }
}
