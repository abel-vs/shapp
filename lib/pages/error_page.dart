import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shapp/pages/info_page.dart';

class ErrorPage extends StatelessWidget {
  ErrorPage(this.detailsException);

  final dynamic detailsException;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: kReleaseMode
            //Widget for release mode
            ? InfoPage(
                icon: Icons.sentiment_dissatisfied_outlined,
                title: "Something went wrong...",
                body: Container(),
              )
            //Widget for debug mode
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                    child: Text('Exeption Details:\n\n$detailsException')),
              ));
  }
}
