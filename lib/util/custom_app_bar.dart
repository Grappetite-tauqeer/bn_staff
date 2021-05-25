import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  static AppBar buildAppBar(String text) {
    return AppBar(
      centerTitle: false,
      titleSpacing: 20.0,
      title: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 22,
        ),
      ),
    );
  }
}
