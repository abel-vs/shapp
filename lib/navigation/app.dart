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
import 'package:shapp/pages/policy_page.dart';
import 'package:shapp/pages/settings_page.dart';
import 'package:shapp/pages/loading_page.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/services/database.dart';

class App extends StatelessWidget {
  GlobalKey<NavigatorState> _navKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Database database = Provider.of<Database>(context);
    return MultiProvider(
      providers: [
        StreamProvider<List<Order>>.value(
          value: database.ordersStream().asBroadcastStream(),
        ),
      ],
      child: WillPopScope(
        onWillPop: () async {
          return !await _navKey.currentState.maybePop();
        },
        child: Navigator(
          initialRoute: 'home',
          key: _navKey,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case 'home':
                return MaterialPageRoute(builder: (context) => HomePage());
              case 'order':
                return MaterialPageRoute(builder: (context) => OrderPage());
              case 'orders':
                return MaterialPageRoute(builder: (context) => OrdersPage());
              case 'order_overview':
                return MaterialPageRoute(builder: (context) => OrderOverviewPage(order: settings.arguments));
              case 'order_confirmed':
                return MaterialPageRoute(builder: (context) => OrderConfirmedPage(order: settings.arguments));
              case 'loading':
                return MaterialPageRoute(builder: (context) => LoadingPage(text: settings.arguments));
              case 'faq':
                return MaterialPageRoute(builder: (context) => FaqPage());
              case 'feedback':
                return MaterialPageRoute(builder: (context) => FeedbackPage());
              case 'settings':
                return MaterialPageRoute(builder: (context) => SettingsPage());
              case 'privacy_policy':
                return MaterialPageRoute(builder: (context) => PolicyPage(title: "privacy_policy", content: AppLocalizations.of(context).translate("privacy_policy_link")));
              case 'general_conditions':
                return MaterialPageRoute(builder: (context) => PolicyPage(title: "general_conditions", content: AppLocalizations.of(context).translate("general_conditions_link")));
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
      ),
    );
  }
}
