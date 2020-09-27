import 'package:Shapp/screens/products_page.dart';
import 'package:Shapp/screens/shops_page.dart';
import 'package:Shapp/services/app_localizations.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate("categories")),
          bottom: TabBar(
            tabs: [
              Tab(text: AppLocalizations.of(context).translate("products")),
              Tab(text: AppLocalizations.of(context).translate("shops")),
            ],
            indicatorColor: Theme.of(context).primaryColor,
          ),
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
}
