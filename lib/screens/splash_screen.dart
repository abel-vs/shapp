import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/welcome.png', width: 190, height: 190),
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 0),
                child: Text('Shapp', style: Theme.of(context).textTheme.headline1),
              ),
            ],
          )),
//      backgroundColor:,
    );
  }
}

