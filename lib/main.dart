import 'package:Shapp/services/auth.dart';
import 'package:Shapp/services/database.dart';
import 'package:Shapp/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

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
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return MultiProvider(
      providers: [
        Provider<AuthBase>(create: (context) => Auth()),
        Provider<Database>(create: (context) => FirestoreDatabase()),
      ],
      child: MaterialApp(
        title: 'Shapp',

        debugShowCheckedModeBanner: false,

        theme: lightTheme,

        darkTheme: darkTheme,

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
      ),
    );
  }
}
