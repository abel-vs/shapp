import 'package:Shapp/screens/search_page.dart';
import 'package:Shapp/services/app_localizations.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        borderRadius: BorderRadius.all(const Radius.circular(50.0)),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: AppLocalizations.of(context).translate("search_product"),
            enabled: false,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(const Radius.circular(50.0)),
            ),
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          ),
        ),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SearchPage(),
          ),
        ),
      ),
    );
  }
}
