import 'package:flutter/material.dart';

class NextIcon extends StatelessWidget {

  NextIcon({this.showPrimaryColor = false});

  bool showPrimaryColor;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.navigate_next,

  /*    color: showPrimaryColor ? PColors.primary_color : MediaQuery.of(context).platformBrightness ==
          Brightness.dark ? PColors.text_colorDart : PColors.text_color,
  */
      
    );
  }
}
