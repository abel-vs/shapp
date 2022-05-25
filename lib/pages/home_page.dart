import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/models/location_picker.dart';
import 'package:shapp/pages/drawer_page.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/services/database.dart';
import 'package:shapp/widgets/location_selection_dialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Database database;
  FirebaseAnalytics analytics;

  @override
  Widget build(BuildContext context) {
    database = Provider.of<Database>(context);
    analytics = Provider.of<FirebaseAnalytics>(context);

    return Scaffold(
      appBar: buildAppBar(context),
      drawer: Drawer(child: DrawerPage()),
      // body: OrdersPage(),
      body: buildBody(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.auto_awesome_motion),
          onPressed: () => Navigator.of(context).pushNamed("orders"),
        )
      ],
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
          builder: (_) => LocationSelectionDialog(),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        child: FloatingActionButton(
          // splashColor: Theme.of(context).canvasColor.withOpacity(0.6),
          child: Icon(
            Icons.shopping_basket,
            color: Theme.of(context).canvasColor,
            size: 100,
          ),
          onPressed: () {
            analytics.logEvent(name: "shapp_button_pressed");
            Navigator.of(context).pushNamed("order");
          },
        ),
      ),
    );
  }
}
