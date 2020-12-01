import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/widgets/expanded_button.dart';
import 'package:shapp/widgets/order_title_block.dart';
import 'package:stripe_payment/stripe_payment.dart';

class OrderPayPage extends StatefulWidget {
  @override
  _OrderPayPageState createState() => _OrderPayPageState();
}

class _OrderPayPageState extends State<OrderPayPage> {
  PageController pageController;
  Order order;

  PaymentIntentResult _paymentIntent;
  Token _paymentToken;
  Source _source;

  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    order = Provider.of<Order>(context);
    pageController = Provider.of<PageController>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderTitleBlock(
          title: "Time to pay",
          subtitle: "Via iDeal Biitch",
        ),
        buildIdealPayment(context),
        Spacer(),
        buildNativePayment(context),
        Spacer(),
        buildButtons(context),
      ],
    );
  }

  RaisedButton buildIdealPayment(BuildContext context) {
    return RaisedButton(
      child: Text("iDeal"),
      onPressed: () {
        StripePayment.createSourceWithParams(SourceParams(
          type: 'ideal',
          amount: 1,
          statementDescriptor: "Beschrijving van het product",
          currency: 'eur',
          returnURL: 'example://stripe-redirect',
        )).then((source) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Received ${source.sourceId}')));
          setState(() {
            _source = source;
          });
        }).catchError((err) => Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('Something went wrong'),
                backgroundColor: Colors.redAccent,
              ),
            ));
      },
    );
  }

  RaisedButton buildNativePayment(BuildContext context) {
    return RaisedButton(
      child: Text("Native payment"),
      onPressed: () {
        if (Platform.isIOS) {
          _controller.jumpTo(450);
        }
        StripePayment.paymentRequestWithNativePay(
          androidPayOptions: AndroidPayPaymentRequest(
            totalPrice: "0.01",
            currencyCode: "EUR",
          ),
          applePayOptions: ApplePayPaymentOptions(
            countryCode: 'NL',
            currencyCode: 'EUR',
            items: [
              ApplePayItem(
                label: 'Test',
                amount: '1',
              )
            ],
          ),
        ).then((token) {
          setState(() {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('Received ${token.tokenId}')));
            _paymentToken = token;
          });
        }).catchError((err) => Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Something went wrong'),
            backgroundColor: Colors.redAccent,
          ),
        ));
      },
    );
  }

  Widget buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: double.maxFinite,
        child: Row(
          children: [
            ExpandedButton(
              text: "Terug",
              function: () {
                pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
              },
            ),
            SizedBox(width: 10),
            ExpandedButton(
              text: "Betaal",
              function: null,
            ),
          ],
        ),
      ),
    );
  }
}
