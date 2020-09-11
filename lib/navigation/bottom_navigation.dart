import 'package:flutter/material.dart';

enum TabItem { HOME, CART, MORE }

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
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_basket),
          title: Text("Lijst"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          title: Text("Meer"),
        ),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
    );
  }
}
