import 'package:shapp/models/category.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/widgets/search_bar.dart';
import 'package:shapp/widgets/category_tile.dart';
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
                itemCount: productCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryTile(category: productCategories.entries.elementAt(index).value);
                }
            ),
          ),
        ),
      ],
    );
  }
}
