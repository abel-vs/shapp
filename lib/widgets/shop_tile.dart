import 'package:Shapp/screens/search_page.dart';
import 'package:Shapp/screens/shop_branch_page.dart';
import 'package:flutter/material.dart';

class ShopTile extends StatelessWidget {
  final String title;
  final String image;

  const ShopTile({
    Key key,
    this.title,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Flexible(
                child: Image(
                  image: AssetImage(this.image),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(this.title, style: Theme.of(context).textTheme.subtitle1,),
              ),
            ],
          ),
        ),
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ShopBranchPage(),
        ),
      ),
      borderRadius: BorderRadius.all(const Radius.circular(5.0)),
      splashColor: Theme.of(context).primaryColor,
    );
  }
}
