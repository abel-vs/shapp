import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Albert Heijn XL",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Text("Supermarkt"),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "Martinus Nijhofflaan",
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                            ),
                            Text(
                              "  " + "7",
                            ),
                          ],
                        ),
                        Text(
                          "Delft",
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                      ],
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
                        height:150,
                        image: AssetImage("assets/images/AlbertHeijnXL.jpg"),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        splashRadius: 10,
                        icon: Icon(Icons.favorite, color: Theme.of(context).primaryColor,),
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
      onTap: () => print("Shop Card Tapped!"),
      borderRadius: BorderRadius.all(const Radius.circular(5.0)),
      splashColor: Theme.of(context).primaryColor,
    );
  }
}
