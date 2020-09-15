import 'package:Shapp/widgets/search_bar.dart';
import 'package:Shapp/widgets/shop_tile.dart';
import 'package:flutter/material.dart';

class ShopBranchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: Text('SliverAppBar'),
//            centerTitle: true,
//            backgroundColor: Colors.transparent,
          expandedHeight: 200.0,
//          floating: true,
          pinned: true,
          snap: false,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset('assets/images/shops/supermarket.png', fit: BoxFit.fitHeight),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(color: Colors.red, height: 150.0),
              Container(color: Colors.purple, height: 150.0),
              Container(color: Colors.green, height: 150.0),
              Container(color: Colors.red, height: 150.0),
              Container(color: Colors.purple, height: 150.0),
              Container(color: Colors.green, height: 150.0),
              Container(color: Colors.red, height: 150.0),
              Container(color: Colors.purple, height: 150.0),
              Container(color: Colors.green, height: 150.0),
              Container(color: Colors.red, height: 150.0),
              Container(color: Colors.purple, height: 150.0),
              Container(color: Colors.green, height: 150.0),
            ],
          ),
        ),
      ]),
    );
  }
}
