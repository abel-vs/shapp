import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  final String text;

  const LoadingPage({Key key, this.text}) : super(key: key);

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
              child: SizedBox(
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).canvasColor),
                ),
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(height: 50),
            Text(
              text.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, color: Theme.of(context).canvasColor),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
