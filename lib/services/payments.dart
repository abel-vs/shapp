import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/services/app_localizations.dart';
import 'package:shapp/services/database.dart';
import 'package:stripe_payment/stripe_payment.dart';

class Payments {
  static Future<Source> executePayment(BuildContext context, Order order) {
    Database database = Provider.of<Database>(context, listen: false);

    return StripePayment.createSourceWithParams(SourceParams(
      type: 'ideal',
      amount: ((order.estimatedPrice + 2) * 100).toInt(),
      statementDescriptor: "Shapp " + AppLocalizations.of(context).translate("order").toLowerCase() + ": " + order.description,
      currency: 'eur',
      returnURL: 'example://stripe-redirect',
    )).then((source) async {
      order.source = source;
      Navigator.of(context).pushNamed("loading", arguments: AppLocalizations.of(context).translate("sending"));
      try{
        await database.placeOrder(order);
        Navigator.of(context).pushNamed("order_confirmed", arguments: order);
      }
      catch (err){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context).translate("something_went_wrong") + ": " + err.toString()),
            backgroundColor: Colors.redAccent,
          ),
        );
        Navigator.of(context).pop();
      }
      return;
    });
  }

// RaisedButton buildNativePayment(BuildContext context) {
//   return RaisedButton(
//     child: Text("Native payment"),
//     onPressed: () {
//       if (Platform.isIOS) {
//         _controller.jumpTo(450);
//       }
//       StripePayment.paymentRequestWithNativePay(
//         androidPayOptions: AndroidPayPaymentRequest(
//           totalPrice: "0.01",
//           currencyCode: "EUR",
//         ),
//         applePayOptions: ApplePayPaymentOptions(
//           countryCode: 'NL',
//           currencyCode: 'EUR',
//           items: [
//             ApplePayItem(
//               label: 'Test',
//               amount: '1',
//             )
//           ],
//         ),
//       ).then((token) {
//         setState(() {
//           Scaffold.of(context).showSnackBar(SnackBar(content: Text('Received ${token.tokenId}')));
//           _paymentToken = token;
//         });
//       }).catchError((err) => Scaffold.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Something went wrong'),
//               backgroundColor: Colors.redAccent,
//             ),
//           ));
//     },
//   );
// }
}
