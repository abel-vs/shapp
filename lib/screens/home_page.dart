import 'package:flutter/rendering.dart';
import 'package:shapp/models/product.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/services/database.dart';
import 'package:shapp/widgets/product_tile.dart';
import 'package:shapp/widgets/search_bar.dart';
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
          _buildProductListView(database.promotedProductsStream('presents')),
          SliverTitle(title: "Populaire producten"),
          _buildProductListView(database.promotedProductsStream('popular_products')),
          SliverTitle(title: "Populaire winkels"),
          _buildProductListView(database.promotedProductsStream('popular_shops')),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildProductListView(Stream<List<Stream<Product>>> products) {
    return SliverToBoxAdapter(
      child: Container(
        height: 270,
        child: StreamBuilder<List<Stream<Product>>>(
            stream: products, // Stream of the list of products
            builder: (context, snapshot) => snapshot.hasData
                ? ListView(
                  scrollDirection: Axis.horizontal,
                  children: snapshot.data // List<Stream<Product>>
                      .map((productStream) => StreamBuilder(
                          stream: productStream,
                          builder: (context, snapshot) =>
                              snapshot.hasData ? ProductTile(product: snapshot.data) : Container()))
                      .toList(),
                )
                : Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
