import 'package:flutter/material.dart';
import '../constants.dart';

class IconText extends StatelessWidget {
  final String text;
  final IconData icon;

  IconText({this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: kIconSize,
        ),
        SizedBox(
          height: kMarginIconText,
        ),
        Text(
          text,
          style: kTextStyle,
        ),
      ],
    );
  }
}
