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
            Text("Favoriete Producten"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: ShopCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: ShopCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: ShopCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: ShopCard(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
