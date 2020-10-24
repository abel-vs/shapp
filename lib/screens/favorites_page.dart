import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/widgets/shop_card.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate("favorites")),
          bottom: _buildTabBar(context),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Favoriete Producten")),
            Center(child: Text("Favoriete Winkels")),
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
