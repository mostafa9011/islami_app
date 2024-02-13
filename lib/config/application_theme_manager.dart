import 'package:flutter/material.dart';

class ApplicationThemeManager {
  static const Color primaryColor = Color(0xFFB7935F);
  static const Color primaryColorDark = Color(0xFFFACC1D);

  static ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontFamily: "El Messiri",
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontFamily: "El Messiri",
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    primaryColor: primaryColor,
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        fontFamily: "El Messiri",
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(
        fontFamily: "El Messiri",
        fontSize: 17,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      selectedIconTheme: IconThemeData(
        color: Colors.black,
      ),
      unselectedItemColor: Colors.white,
      unselectedLabelStyle: TextStyle(
          fontFamily: "El Messiri",
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.normal),
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: primaryColorDark,
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontFamily: "El Messiri",
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontFamily: "El Messiri",
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        fontFamily: "El Messiri",
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xff141A2E),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xffFACC1D),
      selectedLabelStyle: TextStyle(
        fontFamily: "El Messiri",
        fontSize: 17,
        fontWeight: FontWeight.normal,
        color: Color(0xffFACC1D),
      ),
      selectedIconTheme: IconThemeData(
        color: Color(0xffFACC1D),
      ),
      unselectedItemColor: Colors.white,
      unselectedLabelStyle: TextStyle(
          fontFamily: "El Messiri",
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.normal),
      unselectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );
}
