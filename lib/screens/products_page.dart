import 'package:Shapp/models/category.dart';
import 'package:Shapp/services/app_localizations.dart';
import 'package:Shapp/widgets/search_bar.dart';
import 'package:Shapp/widgets/category_tile.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: SearchBar(
              text: AppLocalizations.of(context).translate("search_product")),
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
          child: Container(
            height: 150.0,
            child: ListView.builder(
                padding: EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                itemCount: Categories().categories.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryTile(category: Categories().categories[index],);
                }
            ),
          ),
        ),
      ],
    );
  }
}
