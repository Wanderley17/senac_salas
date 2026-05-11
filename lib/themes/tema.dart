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
      fontFamily: 'NotoSans',
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.vertical(bottom: Radius.circular(30)),
    ),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.indigo,
    unselectedItemColor: Colors.black45,
    elevation: 0.0,
    showUnselectedLabels: true,
    showSelectedLabels: true,
    selectedLabelStyle: TextStyle(fontFamily: 'NotoSans'),
    unselectedLabelStyle: TextStyle(fontFamily: 'NotoSans'),
  ),

  buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.normal),

  datePickerTheme: DatePickerThemeData(
    confirmButtonStyle: ButtonStyle(
      textStyle: WidgetStatePropertyAll(TextStyle(fontFamily: 'NotoSans')),
    ),
    weekdayStyle: TextStyle(fontFamily: 'NotoSans'), //?
    toggleButtonTextStyle: TextStyle(fontFamily: 'NotoSans'), //?
    yearStyle: TextStyle(fontFamily: 'NotoSans'), //?
    headerHeadlineStyle: TextStyle(fontFamily: 'NotoSans'), //?
    cancelButtonStyle: ButtonStyle(
      textStyle: WidgetStatePropertyAll(TextStyle(fontFamily: 'NotoSans')),
    ),
    headerHelpStyle: TextStyle(fontFamily: 'NotoSans'), //?
    dayStyle: TextStyle(fontFamily: 'NotoSans'), //?
  ),
  snackBarTheme: SnackBarThemeData(
    contentTextStyle: TextStyle(fontFamily: 'NotoSans'),
    behavior: SnackBarBehavior.floating, //?
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStatePropertyAll(TextStyle(fontFamily: 'NotoSans')),
    ),
  ),

  cardTheme: CardThemeData(
    color: Colors.white,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 1.5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.circular(14),
      side: BorderSide(color: Colors.indigo, width: 0.5),
    ),
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: Colors.white,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    contentTextStyle: TextStyle(fontFamily: 'NotoSans', color: Colors.black),
    titleTextStyle: TextStyle(
      fontFamily: 'NotoSans',
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.circular(14),
      side: BorderSide(color: Colors.indigo, width: 0.5),
    ),
  ),

  listTileTheme: ListTileThemeData(
    leadingAndTrailingTextStyle: TextStyle(fontFamily: 'NotoSans'),
    titleTextStyle: TextStyle(fontFamily: 'NotoSans', color: Colors.black),
    tileColor: Colors.white,
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.indigo,
    foregroundColor: Colors.white,
    extendedTextStyle: TextStyle(fontFamily: 'NotoSans'),
    elevation: 1.5,
  ),

  popupMenuTheme: PopupMenuThemeData(
    textStyle: TextStyle(fontFamily: 'NotoSans'),
    elevation: 1.5,
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusDirectional.circular(14),
      side: BorderSide(color: Colors.indigo, width: 0.5),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStatePropertyAll(TextStyle(fontFamily: 'NotoSans')),
    ),
  ),

  tabBarTheme: TabBarThemeData(
    labelStyle: TextStyle(fontFamily: 'NotoSans'),
    unselectedLabelStyle: TextStyle(fontFamily: 'NotoSans'),
    labelColor: Colors.indigo,
    unselectedLabelColor: Colors.black45,
  ),

  textTheme: TextTheme(
    bodyLarge: TextStyle(fontFamily: 'NotoSans'),
    bodyMedium: TextStyle(fontFamily: 'NotoSans'),
    bodySmall: TextStyle(fontFamily: 'NotoSans'),
    displayMedium: TextStyle(fontFamily: 'NotoSans'),
    headlineLarge: TextStyle(fontFamily: 'NotoSans'),
    headlineMedium: TextStyle(fontFamily: 'NotoSans'),
    headlineSmall: TextStyle(fontFamily: 'NotoSans'),
    labelLarge: TextStyle(fontFamily: 'NotoSans'),
    labelMedium: TextStyle(fontFamily: 'NotoSans'),
    labelSmall: TextStyle(fontFamily: 'NotoSans'),
    titleLarge: TextStyle(fontFamily: 'NotoSans'),
    titleMedium: TextStyle(fontFamily: 'NotoSans'),
    titleSmall: TextStyle(fontFamily: 'NotoSans'),
  ),
);
