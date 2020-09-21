import 'package:Shapp/screens/cart_page.dart';
import 'package:Shapp/screens/map_page.dart';
import 'package:Shapp/screens/search_page.dart';
import 'package:Shapp/services/app_localizations.dart';
import 'package:Shapp/widgets/search_bar.dart';
import 'package:Shapp/widgets/shop_card.dart';
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
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_basket_outlined),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CartPage(),
              ),
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: SearchBar(),
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
                  Card(child: Placeholder(fallbackWidth: 300,)),
                  Card(child: Placeholder(fallbackWidth: 300,)),
                  Card(child: Placeholder(fallbackWidth: 300,)),
                ],
              ),
            ),
          );
  }
}


