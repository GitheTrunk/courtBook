import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFF5F5F5), // light gray background

  primaryColor: const Color(0xFF4CAF50), // green (used in booking button)
  secondaryHeaderColor: const Color(0xFFE0E0E0), // light grey for inactive tabs

  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color(0xFF4CAF50),
    secondary: const Color(0xFF212121), // used for text
  ),

  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    prefixIconColor: Colors.black54,
    hintStyle: const TextStyle(color: Colors.black45),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF4CAF50), // green
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
    ),
  ),

  cardTheme: CardTheme(
    color: const Color(0xFF4D4D4D), // matches the dark gray card background
    elevation: 4,
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey,
    showSelectedLabels: false,
    showUnselectedLabels: false,
  ),
);
