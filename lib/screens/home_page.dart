import 'package:Shapp/models/product.dart';
import 'package:Shapp/services/app_localizations.dart';
import 'package:Shapp/widgets/product_tile.dart';
import 'package:Shapp/widgets/search_bar.dart';
import 'package:Shapp/widgets/sliver_title.dart';
import 'package:flutter/material.dart';

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
            title: SearchBar(text: AppLocalizations.of(context).translate("search_product"),),
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
    return SliverToBoxAdapter(
      child: Container(
        height: 150.0,
        child: ListView(
          padding: EdgeInsets.all(8),
          scrollDirection: Axis.horizontal,
          children: [
            ProductTile(product: Products().product1,),
            ProductTile(product: Products().product1,),
            ProductTile(product: Products().product1,),
            ProductTile(product: Products().product1,),
            ProductTile(product: Products().product1,),
            ProductTile(product: Products().product1,),
          ],
        ),
      ),
    );
  }
}
