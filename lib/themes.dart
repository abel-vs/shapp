import 'package:flutter/material.dart';

const Color OCEAN_GREEN = Color(0xff57BE92);
const Color GHOST_WHITE = Color(0xffF7F7FF);
const Color CRAYOLA_YELLOW = Color(0xffFFF07C);
const Color TERRA_COTTA_RED = Color(0xffED6A5A);
const Color YALE_BLUE = Color(0xff304D6D);
const Color JET_BLACK = Color(0xff333333);
const Color EERIE_BLACK = Color(0xff222222);

TextTheme textTheme = TextTheme(
  headline6: TextStyle(
    color: OCEAN_GREEN,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  ),
  headline4: TextStyle(
    color: OCEAN_GREEN,
    fontWeight: FontWeight.bold,
    fontSize: 32,
  ),
  subtitle2: TextStyle(
    color: OCEAN_GREEN,
    fontSize: 18,
  ),
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

  brightness: Brightness.light,

  primaryColor: OCEAN_GREEN,
  accentColor: OCEAN_GREEN,
  hintColor: Colors.black,

  // Define the default font family.
  fontFamily: 'Abel',

  // Define the default TextTheme. Use this to specify the default
  // text styling for headlines, titles, bodies of text, and more.
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

    primaryTextTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white)
    ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: EERIE_BLACK,
    elevation: 0,
  ),

  brightness: Brightness.dark,
  primaryColor: OCEAN_GREEN,
  accentColor: OCEAN_GREEN,
  focusColor: Colors.white,

  bottomAppBarColor: Colors.yellow,
  fontFamily: 'Abel',
  textTheme: textTheme,
);
