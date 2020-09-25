import 'package:Shapp/models/shop.dart';
import 'package:Shapp/screens/shop_page.dart';
import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  final Shop shop = new Shop("id", "Albert Heijn XL", "Supermarket", "Delft",
      "Martinus Nijhofflaan", 7, "assets/images/AlbertHeijnXL.jpg");

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Container(
          height: 150,
          width: 300,
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shop.name,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Text(shop.type),
                    Spacer(),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            shop.street,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          ),
                        ),
                        Text(
                          "  " + shop.houseNumber.toString(),
                        ),
                      ],
                    ),
                    Text(
                      shop.city,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image(
                        height: 150,
                        image: AssetImage(shop.image),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        splashRadius: 10,
                        icon: Icon(
                          Icons.favorite,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () => print("Not a favorite anymore"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        elevation: 4,
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
}
