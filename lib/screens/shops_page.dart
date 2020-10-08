import 'package:Shapp/models/category.dart';
import 'package:Shapp/services/app_localizations.dart';
import 'package:Shapp/widgets/search_bar.dart';
import 'package:Shapp/widgets/category_tile.dart';
import 'package:flutter/material.dart';

class ShopsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: SearchBar(
              text: AppLocalizations.of(context).translate("search_shop")),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          floating: true,
          pinned: false,
          snap: false,
          toolbarHeight: 100,
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return CategoryTile(category: shopCategories.entries.elementAt(index).value);
              },
              childCount: shopCategories.length,
            ),
          ),
        ),

      ],
    );
  }
}
