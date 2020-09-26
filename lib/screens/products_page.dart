import 'package:Shapp/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
    );
  }
}
