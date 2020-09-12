import 'package:Shapp/screens/cart_page.dart';
import 'package:Shapp/screens/home_page.dart';
import 'package:Shapp/screens/more_page.dart';
import 'package:Shapp/screens/search_page.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation.dart';

class TabNavigatorRoutes {
  static const String ROOT = '/';
  static const String SEARCH = '/search';

}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  void push(BuildContext context, TabNavigatorRoutes route) {
    var routeBuilders = _routeBuilders(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[route](context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    var rootPage;
    switch (tabItem) {
      case TabItem.HOME:
        rootPage = HomePage();
        break;
      case TabItem.CART:
        rootPage = CartPage();
        break;
      case TabItem.MORE:
        rootPage = MorePage();
        break;
    }

    return {
      TabNavigatorRoutes.ROOT: (context) => rootPage,
      TabNavigatorRoutes.SEARCH:(context) => SearchPage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);

    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.ROOT,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}
