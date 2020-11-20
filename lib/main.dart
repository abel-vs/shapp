import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:shapp/screens/landing_page.dart';
import 'package:shapp/services/auth.dart';
import 'package:shapp/services/database.dart';
import 'package:shapp/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'screens/home_page.dart';
import 'screens/intro_page.dart';
import 'screens/drawer_page.dart';
import 'services/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return MultiProvider(
      providers: [
        Provider<AuthBase>(create: (context) => Auth()),
        Provider<Database>(create: (context) => FirestoreDatabase()),
        Provider<FirebaseAnalytics>(create: (context) => analytics),
      ],
      child: MaterialApp(
        title: 'Shapp',

        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],

        debugShowCheckedModeBanner: false,
        theme: lightTheme,

        darkTheme: darkTheme,

        /// Navigation
        home: LandingPage(),
        routes: <String, WidgetBuilder>{
          '/home': (context) => HomePage(),
          '/more': (context) => DrawerPage(),
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
