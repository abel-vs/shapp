import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/pages/home_page.dart';
import 'package:shapp/pages/info_page.dart';
import 'package:shapp/pages/order_page.dart';
import 'package:shapp/pages/orders_page.dart';
import 'package:shapp/services/database.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Database database = Provider.of<Database>(context);
    return StreamProvider<List<Order>>.value(
      /// Providing orders to all pages
      value: database.ordersStream().asBroadcastStream(),
      initialData: [],
      builder: (context, _) => Navigator(
        // key: GlobalKey<NavigatorState>(),
        initialRoute: 'home',
        // pages: [],
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case 'home':
              return MaterialPageRoute(builder: (_) => HomePage());
              break;
            case 'order':
              return MaterialPageRoute(builder: (_) => OrderPage());
              break;
            case 'orders':
              return MaterialPageRoute(builder: (_) => OrdersPage());
              break;
            default:
              return MaterialPageRoute(
                builder: (_) => InfoPage(
                  icon: Icons.sentiment_dissatisfied_outlined ,
                  title: "Page Not Found",
                  body: Container(),
                ),
              );
          }
        },
      ),
    );
  }
}
