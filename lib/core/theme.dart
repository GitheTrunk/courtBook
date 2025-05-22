import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.lightBlue,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
    surfaceContainer: Colors.grey[200],
    primaryContainer: Colors.blue[100],
    secondaryContainer: Colors.grey,
    onSurface: Colors.black87,
    onPrimaryContainer: Colors.black,
  ),
);
