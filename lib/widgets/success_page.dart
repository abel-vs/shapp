import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {

  final IconData icon;
  final String title;
  final Widget body;

  const SuccessPage({Key key, this.icon, this.title, this.body}) : super(key: key);

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
                icon,
                color: Theme.of(context).canvasColor,
                size: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              title.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, color: Theme.of(context).canvasColor),
            ),
            SizedBox(height: 20),
            body,
            Spacer(),
            SizedBox(
              width: double.maxFinite,
              child: RaisedButton(
                child: Icon(Icons.check, color: Theme.of(context).primaryColor),
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
