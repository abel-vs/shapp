import 'package:flutter/material.dart';
import 'package:shapp/widgets/success_page.dart';

class OrderConfirmedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SuccessPage(
      icon: Icons.check_circle,
      title: "Je bestelling is bevestigd",
      body: Text(
        "Bestelling nummer #78234892",
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
