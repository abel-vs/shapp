import 'package:Shapp/models/category.dart';
import 'package:Shapp/screens/shop_branch_page.dart';
import 'package:Shapp/services/app_localizations.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile({
    Key key, this.category,
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
                  image: AssetImage(category.image),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppLocalizations.of(context).translate(category.name), style: Theme.of(context).textTheme.subtitle1,),
              ),
            ],
          ),
        ),
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ShopBranchPage(category: category,),
        ),
      ),
      borderRadius: BorderRadius.all(const Radius.circular(5.0)),
      splashColor: Theme.of(context).primaryColor,
    );
  }
}
