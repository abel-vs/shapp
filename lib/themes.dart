import 'package:flutter/material.dart';

const Color OCEAN_GREEN = Color(0xff57BE92);
const Color GHOST_WHITE = Color(0xffF7F7FF);
const Color CRAYOLA_YELLOW = Color(0xffFFF07C);
const Color TERRA_COTTA_RED = Color(0xffED6A5A);
const Color YALE_BLUE = Color(0xff304D6D);
const Color JET_BLACK = Color(0xff333333);
const Color EERIE_BLACK = Color(0xff222222);

TextTheme textTheme = TextTheme(
  headline1: TextStyle(
    color: OCEAN_GREEN,
    fontWeight: FontWeight.bold,
    fontSize: 32,
  ),
  headline2: TextStyle(
    color: OCEAN_GREEN,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  ),
  headline3: TextStyle(
    color: OCEAN_GREEN,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  ),
  headline4: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  ),
  headline5: TextStyle(
    color: OCEAN_GREEN,
    fontSize: 18,
  ),
  headline6: TextStyle(
    fontSize: 18,
  ),
  bodyText1: TextStyle(color: Colors.black),
  bodyText2: TextStyle(color: Colors.grey),
);

TextSelectionThemeData textSelectionTheme = TextSelectionThemeData(
  selectionColor: OCEAN_GREEN.withOpacity(0.2),
  selectionHandleColor: OCEAN_GREEN,
  cursorColor: OCEAN_GREEN,
);

ThemeData lightTheme = ThemeData(
  // Define the default brightness and colors.
  appBarTheme: AppBarTheme(
    color: Colors.white,
    textTheme: TextTheme(
      headline6: TextStyle(
        color: OCEAN_GREEN,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        fontFamily: 'Abel',
      ),
    ),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.white),

  brightness: Brightness.light,

  primaryColor: OCEAN_GREEN,
  accentColor: OCEAN_GREEN,
  splashColor: OCEAN_GREEN.withOpacity(0.2),
  textSelectionTheme: textSelectionTheme,
  fontFamily: 'Abel',
  textTheme: textTheme,
);

ThemeData darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: EERIE_BLACK,
    textTheme: TextTheme(
      headline6: TextStyle(
        color: OCEAN_GREEN,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        fontFamily: 'Abel',
      ),
    ),
    iconTheme: IconThemeData(color: OCEAN_GREEN),
  ),
  primaryTextTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: EERIE_BLACK),
  brightness: Brightness.dark,
  primaryColor: OCEAN_GREEN,
  accentColor: OCEAN_GREEN,
  fontFamily: 'Abel',
  textTheme: textTheme,
);
