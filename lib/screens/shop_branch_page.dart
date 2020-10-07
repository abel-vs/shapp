import 'package:Shapp/models/category.dart';
import 'package:Shapp/services/app_localizations.dart';
import 'package:Shapp/themes.dart';
import 'package:Shapp/widgets/shop_card.dart';
import 'package:flutter/material.dart';

class ShopBranchPage extends StatelessWidget {
  final Category category;

  const ShopBranchPage({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: Text(AppLocalizations.of(context).translate(category.name)),
          centerTitle: true,
          pinned: true,
          expandedHeight: 150.0,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              child: Stack(
                children: [
                  Positioned(
                    left: 1,
                    right: 1,
                    bottom: 1,
                    child: Image.asset(
                      category.image,
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
                ),Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: ShopCard(),
                ),Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: ShopCard(),
                ), Padding(
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
