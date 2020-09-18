import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'navigation/app.dart';
import 'screens/products_page.dart';
import 'screens/home_page.dart';
import 'screens/intro_page.dart';
import 'screens/more_page.dart';
import 'services/app_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shapp',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        // Define the default brightness and colors.
        appBarTheme: AppBarTheme(
          color: Colors.white,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Color.fromRGBO(87, 190, 146, 1),
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        brightness: Brightness.light,
        primaryColor: Color.fromRGBO(87, 190, 146, 1),
        accentColor: Color.fromRGBO(87, 190, 146, 1),

        // Define the default font family.
        fontFamily: 'Abel',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        ),
      ),

      /// Navigation
      home: App(),
      routes: <String, WidgetBuilder>{
        '/home': (context) => HomePage(),
        '/cart': (context) => ProductsPage(),
        '/more': (context) => MorePage(),
        '/intro': (context) => IntroPage(),
      },

      /// Localization
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('nl', 'NL'),
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
    );
  }
}
