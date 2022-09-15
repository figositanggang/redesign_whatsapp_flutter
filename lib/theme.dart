import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final MaterialColor _primarySwatch = MaterialColor(
  0xFF3684D3,
  {
    50: Color.fromARGB(255, 112, 184, 255),
    100: Color.fromARGB(255, 90, 173, 255),
    200: Color.fromARGB(255, 63, 159, 255),
    300: Color.fromARGB(255, 14, 134, 255),
    400: Color.fromARGB(255, 74, 142, 210),
    500: Color.fromARGB(255, 54, 132, 211),
    600: Color.fromARGB(255, 4, 107, 209),
    700: Color.fromARGB(255, 56, 107, 157),
    800: Color.fromARGB(255, 27, 82, 137),
    900: Color.fromARGB(255, 3, 66, 128),
  },
);

final ThemeData darkTheme = ThemeData(
  primarySwatch: _primarySwatch,
  scaffoldBackgroundColor: Color.fromARGB(255, 10, 16, 23),
  splashColor: Colors.transparent,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
    decorationColor: Colors.white,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: GoogleFonts.poppins(color: Colors.white),
    ),
  ),
  iconTheme: IconThemeData(color: Colors.white),
  splashFactory: InkSplash.splashFactory,
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.windows: ZoomPageTransitionsBuilder(),
    },
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: Colors.white,
      decorationColor: Colors.white.withOpacity(.75),
    ),
    hintStyle: TextStyle(
      color: Colors.white.withOpacity(.75),
    ),
  ),
);

final Color appBarColor = Color.fromARGB(255, 15, 25, 35);
final Color scaffoldColor = Color.fromARGB(255, 10, 16, 23);
