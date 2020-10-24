import 'package:flutter/material.dart';
import 'package:shapp/models/category.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/widgets/product_tile.dart';

class FilterSheet extends StatefulWidget {
  @override
  _FilterSheetState createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  static const double MAX = 100;
  RangeValues selectedRange = RangeValues(0, MAX);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: <Widget>[
          _buildTitle(context),
          _buildPrice(context),
          buildCategories(),
        ],
      ),
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
                child: Chip(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  label: Text(
                      AppLocalizations.of(context).translate(productCategories.entries.elementAt(index).value.name)),
                ),
              );
            }),
      ),
    );
  }

  ListTile _buildTitle(BuildContext context) {
    return ListTile(
      title: Text(
        'Filters',
        style: Theme.of(context).textTheme.headline6,
      ),
      contentPadding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
    );
  }

  ListTile _buildPrice(BuildContext context) {
    return ListTile(
      title: Text(AppLocalizations.of(context).translate('price')),
      subtitle: RangeSlider(
        values: selectedRange,
        onChanged: (RangeValues newRange) {
          setState(() => selectedRange = newRange);
        },
        min: 0,
        max: 100,
        divisions: 10,
        labels: RangeLabels('€${selectedRange.start.toInt()}', '€${selectedRange.end.toInt()}'),
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: Theme.of(context).primaryColor.withOpacity(0.24),
      ),
    );
  }
}
