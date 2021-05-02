import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'colors.dart';

ThemeData getAppTheme(BuildContext context) {
  final inputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  );
  return ThemeData(
    primaryColor: PColors.black,
    accentColor: PColors.blue,
    primarySwatch: Colors.blue,
    primaryColorBrightness: Brightness.dark,
    accentColorBrightness: Brightness.dark,
    fontFamily: 'Roboto',
    appBarTheme: AppBarTheme(
      centerTitle: true,
      brightness: Brightness.dark,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      hintStyle: TextStyle(
        color: PColors.blue,
      ),
      border: inputBorder,
      focusedBorder: inputBorder,
      enabledBorder: inputBorder,
      focusColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        minimumSize: MaterialStateProperty.all(Size.fromHeight(50)),
        backgroundColor: MaterialStateProperty.all(PColors.blue),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ),
    cupertinoOverrideTheme: CupertinoThemeData(primaryColor: PColors.blue),
    dividerTheme: DividerThemeData(
      thickness: 1.3,
      color: PColors.black,
    ),

    //CupertinoSegmentedControl
  );
}
