import 'package:Shapp/services/app_localizations.dart';
import 'package:flutter/material.dart';

enum TabItem { HOME, PRODUCTS, SHOPS, MAP, MORE }

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentTab.index,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: AppLocalizations.of(context).translate("home"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: AppLocalizations.of(context).translate("products"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: AppLocalizations.of(context).translate("shops"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: AppLocalizations.of(context).translate("map"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: AppLocalizations.of(context).translate("more"),
        ),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
    );
  }
}
