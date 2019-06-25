import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  final String text;
  final Function onPress;
  final heroTag;

  ControlButton({this.text, this.onPress, this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FloatingActionButton(
        heroTag: heroTag,
        backgroundColor: Color(0xFF4C4F5E),
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}