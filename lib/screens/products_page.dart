import 'package:Shapp/services/app_localizations.dart';
import 'package:Shapp/widgets/search_bar.dart';
import 'package:Shapp/widgets/shop_tile.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: SearchBar(
              text: AppLocalizations.of(context).translate("search_product")),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          floating: true,
          pinned: false,
          snap: false,
          toolbarHeight: 100,
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 150.0,
            child: ListView(
              padding: EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              children: [
                ShopTile(
                    title: "Allerhande",
                    image: "assets/images/shops/stationery.png"),
                ShopTile(
                    title: "Kleding",
                    image: "assets/images/shops/boutique.png"),
                ShopTile(
                    title: "Supermarkt",
                    image: "assets/images/shops/supermarket.png"),
                ShopTile(
                    title: "Doe-het-zelf",
                    image: "assets/images/shops/repair_services.png"),
                ShopTile(
                    title: "Kapper",
                    image: "assets/images/shops/barber_shop.png"),
                ShopTile(
                    title: "Dieren", image: "assets/images/shops/pet_shop.png"),
                ShopTile(
                    title: "Delicatessen",
                    image: "assets/images/shops/delicatessen.png"),
                ShopTile(
                    title: "Sieraden",
                    image: "assets/images/shops/jewelry.png"),
                ShopTile(
                    title: "Speelgoed",
                    image: "assets/images/shops/toy_store.png"),
                ShopTile(
                    title: "Elektronica",
                    image: "assets/images/shops/electronics_shop.png"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
