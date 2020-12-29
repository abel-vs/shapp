import 'package:flutter/material.dart';
import 'package:shapp/models/order.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "order_overview", arguments: order);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(5),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    order.state.statusIcon(),
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  SizedBox(width: 15),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.description,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          order.deliveryLocation,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                        // Row(
                        //   children: [
                        //     Flexible(
                        //       child: Text(
                        //         order.deliveryLocation,
                        //         overflow: TextOverflow.fade,
                        //         softWrap: false,
                        //       ),
                        //     ),
                        //     Text(
                        //       "  " + "7",
                        //     ),
                        //   ],
                        // ),
                        // Text(
                        //   "Delft",
                        //   overflow: TextOverflow.fade,
                        //   softWrap: false,
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.state.toReadableString(context),
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText1,
                            children: <TextSpan>[
                              TextSpan(
                                  text: order.delivered
                                      ? "Order geleverd om "
                                      : "Levering: "),
                              TextSpan(
                                text: order.deliveryTime
                                    .toReadableString(context),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            LinearProgressIndicator(
              value: 0.5,
              backgroundColor: Theme.of(context).cardColor,
            ),
          ],
        ),
      ),
    );
  }
}
