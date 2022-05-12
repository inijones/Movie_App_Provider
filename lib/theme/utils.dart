import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData kLightTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color(0xff8468DD),
    ),
    canvasColor: Colors.transparent,
    primaryIconTheme: const IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline5: GoogleFonts.openSans(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 24,
      ),
      bodyText2: GoogleFonts.openSans(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 18,
      ),
      bodyText1: GoogleFonts.openSans(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 16,
      ),
      caption: GoogleFonts.openSans(
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontSize: 14,
      ),
    ),
  );
}

final ThemeData kDarkTheme = _buildDarkTheme();

ThemeData _buildDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    primaryColor: const Color(0xff242248),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color(0xff8468DD),
    ),
    primaryIconTheme: const IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline5: GoogleFonts.openSans(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 24,
      ),
      bodyText2: GoogleFonts.openSans(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 18,
      ),
      bodyText1: GoogleFonts.openSans(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 16,
      ),
      caption: GoogleFonts.openSans(
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontSize: 14,
      ),
    ),
  );
}

final ThemeData kAmoledTheme = _buildAmoledTheme();

ThemeData _buildAmoledTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    primaryColor: Colors.black,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.white,
    ),
    canvasColor: Colors.transparent,
    primaryIconTheme: const IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline5: GoogleFonts.openSans(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 24,
      ),
      bodyText2: GoogleFonts.openSans(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 18,
      ),
      bodyText1: GoogleFonts.openSans(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 16,
      ),
      caption: GoogleFonts.openSans(
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontSize: 14,
      ),
    ),
  );
}
