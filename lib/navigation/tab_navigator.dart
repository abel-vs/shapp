import 'package:Shapp/screens/cart_page.dart';
import 'package:Shapp/screens/home_page.dart';
import 'package:Shapp/screens/more_page.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation.dart';

class TabNavigatorRoutes {
  static const String ROOT = '/';
  static const String HOME = '/home';
  static const String CART = '/cart';
  static const String MORE = '/more';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

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
      TabNavigatorRoutes.HOME: (context) => HomePage(),
      TabNavigatorRoutes.CART: (context) => CartPage(),
      TabNavigatorRoutes.MORE: (context) => MorePage(),
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
