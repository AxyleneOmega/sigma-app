import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sigma_v1/main.dart';

ThemeData light = ThemeData(
  primarySwatch: MaterialColor(0xFF817DEA, sigmaPurple),
  backgroundColor: MaterialColor(0x243242, sigmaNight),
  primaryColor: const Color.fromRGBO(129, 125, 234, 1),
  dividerColor: const Color.fromRGBO(10, 20, 30, 1),
  primaryTextTheme: TextTheme(
    // Section Headings
    headline1: GoogleFonts.montserrat(
        color: const Color.fromRGBO(59, 57, 60, 1),
        fontSize: 22,
        fontWeight: FontWeight.bold),

    // List Font
    bodyText1: GoogleFonts.montserrat(
        color: const Color.fromRGBO(105, 105, 108, 1), fontSize: 16),
  ),
);

ThemeData dark = ThemeData(
    primarySwatch: MaterialColor(0xFF817DEA, sigmaPurple),
    backgroundColor: MaterialColor(0x243242, sigmaNight),
    primaryColor: const Color.fromRGBO(36, 50, 66, 1),
    dividerColor: const Color.fromRGBO(10, 20, 30, 1),
    primaryTextTheme: TextTheme(
      // Section Headings
      headline1: GoogleFonts.montserrat(
          color: const Color.fromRGBO(250, 250, 250, 1),
          fontSize: 22,
          fontWeight: FontWeight.bold),
      labelSmall: GoogleFonts.montserrat(
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      labelMedium: GoogleFonts.montserrat(
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      labelLarge: GoogleFonts.montserrat(
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      // List Font
      bodyText1: GoogleFonts.montserrat(
          color: const Color.fromARGB(255, 255, 255, 255), fontSize: 16),
    ));

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  late SharedPreferences _prefs;
  bool _isDarkTheme = true;

  bool get isDarkTheme => _isDarkTheme;

  ThemeNotifier() {
    _isDarkTheme = false;
    _getThemePref();
  }

  // Switch theme
  toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    _setThemePrefs();
    notifyListeners();
  }

  // Get saved theme preference
  _getThemePref() async {
    await _initPrefs();
    _isDarkTheme = _prefs.getBool(key) ?? false;
    notifyListeners();
  }

  // Set theme preference
  _setThemePrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _isDarkTheme);
  }

  // Initiate a preference
  _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
