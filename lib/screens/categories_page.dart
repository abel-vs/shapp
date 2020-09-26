import 'package:Shapp/screens/products_page.dart';
import 'package:Shapp/screens/shops_page.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Products",),
              Tab(text: "Shops",),
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
