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
          _buildScrollView(),
          SliverTitle(title: "In de kijker"),
          _buildScrollView(),
          SliverTitle(title: "Voor jou"),
          _buildScrollView(),
          SliverTitle(title: "Populaire producten"),
          _buildScrollView(),
          SliverTitle(title: "Populaire winkels"),
          _buildScrollView(),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildScrollView() {
    final database = Provider.of<Database>(context);
    return SliverToBoxAdapter(
      child: Container(
        height: 150.0,
        child: StreamBuilder<List<Product>>(
          stream: database.productsStream(),
          builder: (context, snapshot) => snapshot.hasData
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ProductTile(product: snapshot.data.elementAt(index));
                  },
                )
              : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
