import 'package:flutter/material.dart';

class OrderConfirmedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Center(
              child: Icon(
                Icons.check_circle,
                color: Theme.of(context).canvasColor,
                size: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Je bestelling is bevestigd".toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, color: Theme.of(context).canvasColor),
            ),
            SizedBox(height: 20),
            Text(
              "Bestelling nummer #78234892",
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).canvasColor, fontWeight: FontWeight.bold),
            ),
            // SizedBox(height: 20),
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
            Spacer(),
            SizedBox(
              width: double.maxFinite,
              child: RaisedButton(
                child: Text(
                  "Okay",
                  style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 20),
                ),
                color: Theme.of(context).canvasColor,
                onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
              ),
            )
          ],
        ),
      ),
    );
  }
}
