import 'package:Shapp/widgets/search_bar.dart';
import 'package:Shapp/widgets/shop_card.dart';
import 'package:Shapp/widgets/shop_tile.dart';
import 'package:flutter/material.dart';

class ShopBranchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: Text('Supermarkt'),
          centerTitle: true,
          pinned: true,
          expandedHeight: 150.0,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              child: Stack(
                children: [
                  Positioned(
                      bottom: 1,
                      left: 1,
                      right: 1,
                      child: Opacity(
                        opacity: 0.7,
                        child: Image.asset(
                            "assets/images/shops/shop_background.png"),
                      )),
                  Positioned(
                    left: 1,
                    right: 1,
                    bottom: 1,
                    child: Image.asset(
                      'assets/images/shops/supermarket.png',
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ShopCard(),
              ShopCard(),
              ShopCard(),
              ShopCard(),
              ShopCard(),
            ],
          ),
        ),
      ]),
    );
  }
}
