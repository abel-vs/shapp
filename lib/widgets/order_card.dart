import 'package:flutter/material.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/services/app_localizations.dart';

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
                    order.state.toStatusIcon(),
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  SizedBox(width: 15),
                  Flexible(
                    flex: 2,
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
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          order.state.toReadableString(context),
                          style: Theme.of(context).textTheme.headline6,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText1,
                            children: <TextSpan>[
                              TextSpan(
                                  text: order.delivered
                                      ? AppLocalizations.of(context).translate("delivered_at") + ": "
                                      : AppLocalizations.of(context).translate("delivered_at") + ": "),
                              TextSpan(
                                text: order.deliveryTime.toReadableString(context, order.today),
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
            // LinearProgressIndicator(
            //   value: order.state.toPercentage(),
            //   backgroundColor: Theme.of(context).cardColor,
            // ),
          ],
        ),
      ),
    );
  }
}
