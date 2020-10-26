import 'package:flutter/material.dart';
import 'package:shapp/models/product.dart';
import 'package:shapp/services/app_localizations.dart';

import 'filter_sheet.dart';

class ProductSearch extends SearchDelegate<Product> {
  ProductSearch(BuildContext context)
      : super(
          searchFieldLabel: AppLocalizations.of(context).translate('search_product'),
          searchFieldStyle: TextStyle(fontSize: 18),
        );

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.filter_list),
        onPressed: () => _showFilterBottomSheet(context),
      ),
      query.isEmpty
          ? Container()
          : IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                query = '';
              },
            )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  void _showFilterBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (BuildContext context) {
          return FilterSheet();
        });
  }
}
