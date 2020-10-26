import 'package:shapp/models/category.dart';
import 'package:shapp/models/shop.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/widgets/search_bar.dart';
import 'package:shapp/widgets/category_tile.dart';
import 'package:shapp/widgets/sliver_header.dart';
import 'package:shapp/widgets/sliver_shop_header.dart';
import 'package:shapp/widgets/sliver_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  final Shop shop;

  const ShopPage({Key key, this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: SliverShopHeader(
              expandedHeight: 200,
              shop: shop,
            ),
          ),
          SliverHeader(
              widget: SearchBar(
                  text:
                      AppLocalizations.of(context).translate("search_product")),
              height: 100),
          SliverTitle(
              title: AppLocalizations.of(context).translate("categories")),
          SliverToBoxAdapter(
            child: Container(
              height: 150.0,
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                  itemCount: shopCategories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryTile(category: shopCategories[index],);
                  }
              ),
            ),
          ),
          SliverTitle(title: AppLocalizations.of(context).translate("deals")),
          SliverToBoxAdapter(
            child: Container(height: 100, child: Placeholder()),
          ),
          SliverTitle(title: AppLocalizations.of(context).translate("popular_products")),
        ],
      ),
    );
  }
}
