import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:shapp/navigation/landing_page.dart';
import 'package:shapp/pages/error_page.dart';
import 'package:shapp/services/auth.dart';
import 'package:shapp/services/database.dart';
import 'package:shapp/services/preferences_provider.dart';
import 'package:shapp/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'services/app_localizations.dart';

import 'package:stripe_payment/stripe_payment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  StripePayment.setOptions(StripeOptions(
      publishableKey:
          "pk_test_51HoqjPCn8fuy3fijvWHsIaEjvVhPBvIkB4hTnavS9gSMFcFxS9HCXsLCvpMb9uaVMD9mAFCOIbfZXVVDKNSnvipI00WnlnLe5X",
      //YOUR_PUBLISHABLE_KEY
      merchantId: "Shapp", //YOUR_MERCHANT_ID
      androidPayMode: 'test'));
  // Set custom error screen
  // ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) => ErrorPage(flutterErrorDetails.exception);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

    return MultiProvider(
      providers: [
        Provider<AuthBase>(create: (context) => Auth()),
        Provider<Database>(create: (context) => FirestoreDatabase()),
        Provider<FirebaseAnalytics>(create: (context) => analytics),
        ChangeNotifierProvider<PreferencesProvider>(create: (context) => PreferencesProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) => Consumer<PreferencesProvider>(
          child: LandingPage(),
          builder: (context, preferences, child) {
            return MaterialApp(
              title: 'Shapp',

              navigatorObservers: [
                FirebaseAnalyticsObserver(analytics: analytics),
              ],

              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: preferences.themeMode == "DARK"
                  ? ThemeMode.dark
                  : preferences.themeMode == "LIGHT"
                      ? ThemeMode.light
                      : ThemeMode.system,

              /// Navigation
              home: child,

              /// Localization
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: preferences.locale,
              supportedLocales: supportedLocales.values,
              // Returns a locale which will be used by the app
              localeResolutionCallback: (locale, supportedLocales) => localeResolution(locale, supportedLocales),
            );
          },
        ),
      ),
    );
  }
}
