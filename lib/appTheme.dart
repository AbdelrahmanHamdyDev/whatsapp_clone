import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xFF25D366),
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.robotoTextTheme(ThemeData.light().textTheme),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color.fromARGB(255, 24, 135, 65),
    scaffoldBackgroundColor: const Color(0xFF121B22),
    textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
  );
}
