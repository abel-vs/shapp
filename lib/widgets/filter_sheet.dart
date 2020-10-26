import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shapp/models/category.dart';
import 'package:shapp/services/app_localizations.dart';

enum SortingOrder {
  RELEVANCE,
  PRICE_ASCENDING,
  PRICE_DESCENDING,
  ALPHABET_ASCENDING,
  ALPHABET_DESCENDING,
}

class FilterSheet extends StatefulWidget {
  @override
  _FilterSheetState createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  static const double MAX = 100;
  RangeValues selectedPriceRange = RangeValues(0, MAX);

  Set<Category> selectedCategories = Set();

  SortingOrder sortingOrder = SortingOrder.RELEVANCE;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        buildTitle(context),
        buildPrice(context),
        buildCategories(),
        buildSortingOrder()
      ],
    );
  }

  ListTile buildSortingOrder() {
    return ListTile(
          title: Text("Sorteren op"),
          subtitle: Column(
            children: [
              buildSortingOrderOption("Relevance", SortingOrder.RELEVANCE),
              buildSortingOrderOption("Price (low to high)", SortingOrder.PRICE_ASCENDING),
              buildSortingOrderOption("Price (high to low)", SortingOrder.PRICE_DESCENDING),
              buildSortingOrderOption("Alphabetically (low to high)", SortingOrder.ALPHABET_ASCENDING),
              buildSortingOrderOption("Alphabetically (low to high)", SortingOrder.ALPHABET_DESCENDING),
            ],
          ),
        );
  }

  CheckboxListTile buildSortingOrderOption(String title, SortingOrder sortingOrder) {
    return CheckboxListTile(
              title: Text(title),
              value: this.sortingOrder == sortingOrder,
              onChanged: (selected) {
                setState(() {
                  this.sortingOrder = selected ? sortingOrder : SortingOrder.RELEVANCE;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            );
  }

  ListTile buildCategories() {
    return ListTile(
      title: Text(AppLocalizations.of(context).translate('categories')),
      subtitle: Container(
        height: 50,
        child: ListView.builder(
            padding: EdgeInsets.all(8),
            scrollDirection: Axis.horizontal,
            itemCount: productCategories.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  selected: selectedCategories.contains(productCategories.values.elementAt(index)),
                  onSelected: (selected) {
                    setState(() {
                      Category category = productCategories.values.elementAt(index);
                      selected ? selectedCategories.add(category) : selectedCategories.remove(category);
                    });
                  },
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  label: Text(
                      AppLocalizations.of(context).translate(productCategories.entries.elementAt(index).value.name)),
                ),
              );
            }),
      ),
    );
  }

  ListTile buildTitle(BuildContext context) {
    return ListTile(
      title: Text(
        'Filters',
        style: Theme.of(context).textTheme.headline6,
      ),
      contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
    );
  }

  ListTile buildPrice(BuildContext context) {
    return ListTile(
      title: Text(AppLocalizations.of(context).translate('price')),
      subtitle: RangeSlider(
        values: selectedPriceRange,
        onChanged: (RangeValues newRange) {
          setState(() => selectedPriceRange = newRange);
        },
        min: 0,
        max: 100,
        divisions: 10,
        labels: RangeLabels('€${selectedPriceRange.start.toInt()}', '€${selectedPriceRange.end.toInt()}'),
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: Theme.of(context).primaryColor.withOpacity(0.24),
      ),
    );
  }
}
