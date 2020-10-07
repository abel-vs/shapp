import 'package:Shapp/screens/search_page.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String text;

  const SearchBar({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(const Radius.circular(50.0)),
      child: Material(
        elevation: 10,
        borderRadius: const BorderRadius.all(const Radius.circular(50.0)),
        child: TextField(
          enabled: false,
          decoration: InputDecoration(
            filled: true,
            hintText: text,
            disabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(const Radius.circular(50.0)),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            prefixIcon: Icon(Icons.search,
              color: Theme.of(context).textTheme.bodyText1.color,
            ),
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          ),
        ),
      ),
      onTap: () =>
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SearchPage(),
            ),
          ),
    );
  }
}
