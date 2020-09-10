import 'package:Shapp/screens/intro_page.dart';
import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shapp',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Color.fromRGBO(80, 167, 194, 1),
        accentColor: Color.fromRGBO(183, 248, 219, 1),

        // Define the default font family.
        fontFamily: 'Abel',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        ),
      ),
      home: IntroPage(),
      routes: <String, WidgetBuilder>{},
    );
  }
}
