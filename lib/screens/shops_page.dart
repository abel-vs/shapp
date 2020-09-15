import 'package:Shapp/widgets/search_bar.dart';
import 'package:Shapp/widgets/shop_tile.dart';
import 'package:flutter/material.dart';

class ShopsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Winkels"),
      ),
      body: Column(
        children: [
          SearchBar(),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(10),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                ShopTile(
                    title: "Allerhande",
                    image: "assets/images/shops/stationery.png"),
                ShopTile(
                    title: "Kleding", image: "assets/images/shops/boutique.png"),
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
                    title: "Sieraden", image: "assets/images/shops/jewelry.png"),
                ShopTile(
                    title: "Speelgoed",
                    image: "assets/images/shops/toy_store.png"),
                ShopTile(
                    title: "Elektronica",
                    image: "assets/images/shops/electronics_shop.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
