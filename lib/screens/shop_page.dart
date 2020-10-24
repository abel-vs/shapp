import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shapp/models/category.dart';
import 'package:shapp/models/shop.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/widgets/search_bar.dart';
import 'package:shapp/widgets/sliver_header.dart';
import 'package:shapp/widgets/sliver_shop_header.dart';
import 'package:shapp/widgets/sliver_title.dart';

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
          SliverHeader(widget: SearchBar(text: AppLocalizations.of(context).translate("search_product")), height: 100),
          SliverTitle(title: AppLocalizations.of(context).translate("categories")),
          SliverToBoxAdapter(
            child: Container(
              height: 50,
              child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  itemCount: productCategories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Chip(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        label: Text(AppLocalizations.of(context).translate(productCategories.entries.elementAt(index).value.name)),
                      ),
                    );
                  }),
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
