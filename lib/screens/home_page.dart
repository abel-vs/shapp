import 'package:flutter/rendering.dart';
import 'package:shapp/models/product.dart';
import 'package:shapp/models/shop.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/services/database.dart';
import 'package:shapp/widgets/product_card.dart';
import 'package:shapp/widgets/product_list_view.dart';
import 'package:shapp/widgets/search_bar.dart';
import 'package:shapp/widgets/shop_card.dart';
import 'package:shapp/widgets/sliver_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Shapp"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: SearchBar(
              text: AppLocalizations.of(context).translate("search_product"),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            floating: true,
            pinned: true,
            snap: false,
            toolbarHeight: 100,
          ),
          SliverTitle(title: "Koop iemand een cadeautje"),
          SliverToBoxAdapter(child: ProductListView(products: database.promotedProductsStream('presents').asBroadcastStream())),
          SliverTitle(title: "Populaire producten"),
          SliverToBoxAdapter(child: ProductListView(products: database.promotedProductsStream('popular_products').asBroadcastStream())),
          SliverTitle(title: "Populaire winkels"),
          _buildShopListView(),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildShopListView() {
    return SliverToBoxAdapter(child: Column(children: [ShopCard(), ShopCard(), ShopCard()]));
  }
}
