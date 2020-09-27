import 'package:Shapp/services/app_localizations.dart';
import 'package:flutter/material.dart';

enum TabItem { HOME, SEARCH, FAVORITES, MAP, MORE }

class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentTab.index,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: AppLocalizations.of(context).translate("home"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: AppLocalizations.of(context).translate("search"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: AppLocalizations.of(context).translate("favorites"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
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
