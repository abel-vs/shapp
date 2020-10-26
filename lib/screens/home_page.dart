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
          _buildScrollView('presents'),
          SliverTitle(title: "Populaire producten"),
          _buildScrollView('popular_products'),
          SliverTitle(title: "Populaire winkels"),
          _buildScrollView('popular_shops'),
        ],
      ),
    );
  }


  SliverToBoxAdapter _buildScrollView(String promotion) {
    final database = Provider.of<Database>(context);
    return SliverToBoxAdapter(
      child: Container(
        height: 150.0,
        child: StreamBuilder<List<Stream<Product>>>(
          stream: database.promotedProductsStream(promotion), // Stream of the list of products
          builder: (context, snapshot) => snapshot.connectionState == ConnectionState.active
              ? snapshot.hasData
                  ?
//          Text('data')
                  ListView(
                      scrollDirection: Axis.horizontal,
                      children: snapshot.data // List<Stream<Product>>
                          .map((productStream) => StreamBuilder(
                              stream: productStream,
                              builder: (context, snapshot) =>
                                  snapshot.hasData ? ProductTile(product: snapshot.data) : Container()))
                          .toList(),
                    )
                  : Center(child: Center(child: CircularProgressIndicator()))
              : Center(child: Text("No Connection...")),
        ),
      ),
    );
  }
}
