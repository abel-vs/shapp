import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/models/category.dart';
import 'package:shapp/models/shop.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/services/database.dart';
import 'package:shapp/widgets/product_list_view.dart';
import 'package:shapp/widgets/search_bar.dart';
import 'package:shapp/widgets/sliver_header.dart';
import 'package:shapp/widgets/sliver_shop_header.dart';
import 'package:shapp/widgets/sliver_title.dart';

class ShopPage extends StatelessWidget {
  final Shop shop;

  const ShopPage({Key key, this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: SliverShopHeader(
              expandedHeight: 150,
              shop: shop,
            ),
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyText1,
                    children: [
                      TextSpan(text: 'Uren' + ":  ", style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "Open nu",
                          style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold)),
                      TextSpan(text: "  "),
                      TextSpan(text: "9:00 - 16:00"),
                    ],
                  ),
                ),
                Spacer(),
                FlatButton(
                  child: Row(
                    children: [
                      Text(
                        "Winkel Info ",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Icon(Icons.arrow_forward_ios, size: 12, color: Theme.of(context).primaryColor,),
                    ],
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            pinned: true,
            backgroundColor: Theme.of(context).canvasColor,
            elevation: 0,
          ),
          SliverHeader(widget: SearchBar(text: AppLocalizations.of(context).translate("search_product")), height: 100),
          SliverTitle(title: AppLocalizations.of(context).translate("categories")),
          buildCategories(),
          SliverTitle(title: AppLocalizations.of(context).translate("deals")),
          SliverToBoxAdapter(
              child:
                  ProductListView(products: database.promotedProductsStream('popular_products').asBroadcastStream())),
          SliverTitle(title: AppLocalizations.of(context).translate("popular_products")),
          SliverToBoxAdapter(
              child:
                  ProductListView(products: database.promotedProductsStream('popular_products').asBroadcastStream())),
        ],
      ),
    );
  }

  SliverToBoxAdapter buildCategories() {
    return SliverToBoxAdapter(
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
                  label: Text(
                      AppLocalizations.of(context).translate(productCategories.entries.elementAt(index).value.name)),
                ),
              );
            }),
      ),
    );
  }
}
