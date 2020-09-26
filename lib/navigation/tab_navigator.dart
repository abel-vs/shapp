import 'package:Shapp/screens/categories_page.dart';
import 'package:Shapp/screens/map_page.dart';
import 'package:Shapp/screens/products_page.dart';
import 'package:Shapp/screens/home_page.dart';
import 'package:Shapp/screens/more_page.dart';
import 'package:Shapp/screens/shops_page.dart';
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
      case TabItem.PRODUCTS:
        rootPage = CategoriesPage();
        break;
      case TabItem.SHOPS:
        rootPage = ShopsPage();
        break;
      case TabItem.MAP:
        rootPage = MapPage();
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
