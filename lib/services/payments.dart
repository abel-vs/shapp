import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/screens/order_confirmed_page.dart';
import 'package:shapp/services/database.dart';
import 'package:stripe_payment/stripe_payment.dart';

class Payments {
  static Future<Source> executePayment(BuildContext context, Order order) {
    Database database = Provider.of<Database>(context, listen: false);

    return StripePayment.createSourceWithParams(SourceParams(
      type: 'ideal',
      amount: ((order.estimatedPrice + 2) * 100).toInt(),
      statementDescriptor: "Shapp bestelling: " + order.description,
      currency: 'eur',
      returnURL: 'example://stripe-redirect',
    )).then((source) {
      order.source = source;
      database.placeOrder(order);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OrderConfirmedPage(order: order),
        ),
      );
    }).catchError((err) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Something went wrong'),
          backgroundColor: Colors.redAccent,
        ),
      );
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
