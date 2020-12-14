import 'package:flutter/material.dart';
import 'package:shapp/models/order.dart';
import 'package:shapp/pages/info_page.dart';
import 'package:shapp/services/app_localizations.dart';

class OrderConfirmedPage extends StatelessWidget {
  final Order order;

  const OrderConfirmedPage({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoPage(
      icon: Icons.check_circle,
      title: AppLocalizations.of(context).translate("order_confirmed"),
      body: Text(
        AppLocalizations.of(context).translate("order") + " ID: " + order.source.sourceId.substring(4),
        textAlign: TextAlign.center,
        style: TextStyle(color: Theme.of(context).canvasColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// SizedBox(
//   width: double.maxFinite,
//   child: Container(
//     padding: EdgeInsets.all(20),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10),
//       border: Border.all(
//         color: Theme.of(context).canvasColor
//       ),
//     ),
//     child: Column(
//       children: [
//         Text(
//           "Verwachte levertijd:",
//           style: TextStyle(color: Theme.of(context).canvasColor),
//         ),
//         SizedBox(height: 10),
//         Text(
//           "ZONDAG 6/12/2020\n 10:00".toUpperCase(),
//           textAlign: TextAlign.center,
//           style: TextStyle(color: Theme.of(context).canvasColor, fontWeight: FontWeight.bold, fontSize: 20),
//         )
//       ],
//     ),
//   ),
// ),
