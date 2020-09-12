import 'package:Shapp/screens/cart_page.dart';
import 'package:Shapp/screens/home_page.dart';
import 'package:Shapp/screens/more_page.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  @override
  Widget build(BuildContext context) {
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

    return Navigator(
      key: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => rootPage,
        );
      },
    );
  }
}
