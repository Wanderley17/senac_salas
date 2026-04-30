import 'package:flutter/material.dart';

ThemeData get tema => ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarThemeData(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.transparent,
    foregroundColor: Colors.black,
    centerTitle: false,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 23,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.2,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.vertical(
        bottom: Radius.circular(30)
      )
    )
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.indigo,
    unselectedItemColor: Colors.black45,
    elevation: 0.0,
    showUnselectedLabels: false,
    showSelectedLabels: true,
  ),
);
