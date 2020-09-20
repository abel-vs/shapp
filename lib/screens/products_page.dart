import 'package:Shapp/widgets/search_bar.dart';
import 'package:Shapp/widgets/shop_tile.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Producten")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: SearchBar(),
              centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              floating: true,
              pinned: false,
              snap: false,
              toolbarHeight: 100,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Categorieën",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                Card(),
                Card(),
                Card(),
                Card(),
                Card(),
                Card(),
                Card(),
                Card(),
                Card(),
                Card(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
