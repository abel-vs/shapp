import 'package:shapp/screens/products_page.dart';
import 'package:shapp/screens/shops_page.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate("categories")),
          bottom: _buildTabBar(context),
        ),
        body: TabBarView(
          children: [
            ProductsPage(),
            ShopsPage(),
          ],
        ),
      ),
    );
  }

  TabBar _buildTabBar(BuildContext context) {
    return TabBar(
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w300),
      tabs: [
        Tab(text: AppLocalizations.of(context).translate("products")),
        Tab(text: AppLocalizations.of(context).translate("shops")),
      ],
      indicatorColor: Theme.of(context).primaryColor,
      labelColor: Theme.of(context).primaryColor,
      unselectedLabelColor: Colors.grey,
    );
  }
}
