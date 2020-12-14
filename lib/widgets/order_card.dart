import 'package:flutter/material.dart';
import 'package:shapp/models/order.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(order.state.name, style: Theme.of(context).textTheme.headline3,),
                  Text(order.description),
                ],
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.navigate_next),
                onPressed: () {},
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
