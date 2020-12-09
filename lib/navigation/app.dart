import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/screens/home_page.dart';
import 'package:shapp/screens/order_page.dart';
import 'package:shapp/screens/orders_page.dart';
import 'package:shapp/services/database.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Database database = Provider.of<Database>(context);
    return StreamProvider<List<Order>>.value(
      /// Providing orders to all screens
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
                builder: (_) => Scaffold(
                  body: Center(
                    child: Text("Route Not FOund"),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
