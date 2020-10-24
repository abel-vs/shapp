import 'package:shapp/navigation/tab_navigator.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  TabItem _currentTab = TabItem.HOME;
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.HOME: GlobalKey<NavigatorState>(),
    TabItem.SEARCH: GlobalKey<NavigatorState>(),
    TabItem.FAVORITES: GlobalKey<NavigatorState>(),
    TabItem.MAP: GlobalKey<NavigatorState>(),
    TabItem.MORE: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.HOME) {
            // select 'main' tab
            _selectTab(TabItem.HOME);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.HOME),
          _buildOffstageNavigator(TabItem.SEARCH),
          _buildOffstageNavigator(TabItem.FAVORITES),
          _buildOffstageNavigator(TabItem.MAP),
          _buildOffstageNavigator(TabItem.MORE),
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
