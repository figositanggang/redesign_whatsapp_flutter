import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData darkTheme = ThemeData(
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
);
