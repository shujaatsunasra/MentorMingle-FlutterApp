// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color kPrimaryColor = Color(0xFFED8664);
  static const Color kScaffoldBackgroundColor = Color(0xFFDEDDD2);
  static const Color kAppBarBackgroundColor = Color(0xFFED8664);
  static const Color kSubheadingColor = Color(0xFF999999);
  static const Color kWhite70 = Colors.white70;
  static Color kGreyShade800 = Colors.grey.shade800;

  static ThemeData lightTheme = ThemeData(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kScaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: kAppBarBackgroundColor,
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.bebasNeue(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: kGreyShade800,
      ),
      headline2: GoogleFonts.bebasNeue(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: kSubheadingColor,
      ),
      headline3: GoogleFonts.bebasNeue(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      ),
      bodyText1: GoogleFonts.shareTech(
        fontSize: 16,
        color: Colors.black,
      ),
      bodyText2: GoogleFonts.shareTech(
        fontSize: 14,
        color: kGreyShade800,
      ),
    ),
  );
}
