import 'package:flutter/material.dart';

class IntroInfo extends StatelessWidget {
  final String image;
  final String header;
  final String text;

  IntroInfo(this.image, this.header, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset(
            image,
            height: 200,
            width: 200,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            header,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 14.0),
          ),
        )
      ],
    );
  }
}
