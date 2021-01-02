import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/pages/faq_page.dart';
import 'package:shapp/pages/feedback_page.dart';
import 'package:shapp/pages/home_page.dart';
import 'package:shapp/pages/info_page.dart';
import 'package:shapp/pages/order_confirmed_page.dart';
import 'package:shapp/pages/order_overview_page.dart';
import 'package:shapp/pages/order_page.dart';
import 'package:shapp/pages/orders_page.dart';
import 'package:shapp/pages/settings_page.dart';
import 'package:shapp/pages/loading_page.dart';
import 'package:shapp/services/database.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Database database = Provider.of<Database>(context);
    return MultiProvider(
      providers: [
        StreamProvider<List<Order>>.value(
          value: database.ordersStream().asBroadcastStream(),
        ),
      ],
      child: Navigator(
        initialRoute: 'home',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case 'home':
              return MaterialPageRoute(builder: (context) => HomePage());
              break;
            case 'order':
              return MaterialPageRoute(builder: (context) => OrderPage());
              break;
            case 'orders':
              return MaterialPageRoute(builder: (context) => OrdersPage());
              break;
            case 'order_overview':
              return MaterialPageRoute(builder: (context) => OrderOverviewPage(order: settings.arguments));
              break;
            case 'order_confirmed':
              return MaterialPageRoute(builder: (context) => OrderConfirmedPage(order: settings.arguments));
              break;
            case 'loading':
              return MaterialPageRoute(builder: (context) => LoadingPage(text: settings.arguments));
              break;
            case 'faq':
              return MaterialPageRoute(builder: (context) => FaqPage());
              break;
            case 'feedback':
              return MaterialPageRoute(builder: (context) => FeedbackPage());
              break;
            case 'settings':
              return MaterialPageRoute(builder: (context) => SettingsPage());
              break;
            default:
              return MaterialPageRoute(
                builder: (context) => InfoPage(
                  icon: Icons.sentiment_dissatisfied_outlined,
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
