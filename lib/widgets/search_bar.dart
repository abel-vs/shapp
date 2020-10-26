import 'package:shapp/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:shapp/widgets/product_search.dart';

class SearchBar extends StatelessWidget {
  final String text;

  static const double RADIUS = 5;

  const SearchBar({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.all(const Radius.circular(RADIUS)),
        child: Material(
          elevation: 10,
          borderRadius: const BorderRadius.all(const Radius.circular(RADIUS)),
          child: TextField(
            enabled: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).cardColor,
              hintText: text,
              disabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(const Radius.circular(RADIUS)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Theme.of(context).textTheme.bodyText1.color,
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            ),
          ),
        ),
        onTap: () => showSearch(
              context: context,
              delegate: ProductSearch(context),
            )
//          Navigator.of(context).push(
//            MaterialPageRoute(
//              builder: (context) => SearchPage(),
//            ),
//          ),
        );
  }
}
