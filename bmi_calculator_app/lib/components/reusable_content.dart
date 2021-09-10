import 'package:flutter/material.dart';

class ReusableContent extends StatelessWidget {
  ReusableContent(this.icon, this.text);
  final IconData icon;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        text,
      ],
    );
  }
}