import 'package:shapp/models/shop.dart';
import 'package:shapp/screens/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:shapp/services/app_localizations.dart';

class ShopCard extends StatefulWidget {
  @override
  _ShopCardState createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCard> {
  final Shop shop = new Shop("id", "Albert Heijn XL", "supermarket", "Delft", "Martinus Nijhofflaan", 7,
      "assets/images/AlbertHeijnXL.jpg", null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Stack(children: [
          Container(
            height: 120,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                buildImage(context),
                SizedBox(width: 20),
                buildInfo(context),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: Icon(
                Icons.favorite_outline,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () => print("Not a favorite anymore"),
            ),
          ),
        ]),
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ShopPage(shop: shop),
        ),
      ),
      borderRadius: BorderRadius.all(const Radius.circular(5.0)),
      splashColor: Theme.of(context).primaryColor,
    );
  }

  Widget buildInfo(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).translate(shop.type),
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            shop.name,
            style: Theme.of(context).textTheme.headline6,
          ),
          Spacer(),
          Row(
            children: [
              Flexible(
                child: Text(
                  shop.street,
                  overflow: TextOverflow.fade,
                  softWrap: false,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Text(
                "  " + shop.houseNumber.toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          Text(
            shop.city,
            overflow: TextOverflow.fade,
            softWrap: false,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image(image: AssetImage(shop.image)),
    );
  }
}
