import 'package:Shapp/services/app_localizations.dart';
import 'package:Shapp/widgets/shop_card.dart';
import 'package:flutter/material.dart';

class ShopBranchPage extends StatelessWidget {
  final String branch;
  final String image;

  ShopBranchPage(this.branch, this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: Text(branch),
          centerTitle: true,
          pinned: true,
          expandedHeight: 150.0,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              child: Stack(
                children: [
//                  Positioned(
//                      bottom: 1,
//                      left: 1,
//                      right: 1,
//                      child: Opacity(
//                        opacity: 0.7,
//                        child: Image.asset(
//                            "assets/images/shops/shop_background.png"),
//                      )),
                  Positioned(
                    left: 1,
                    right: 1,
                    bottom: 1,
                    child: Image.asset(
                      image,
                      height: 100,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
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
        ),
      ]),
    );
  }
}
