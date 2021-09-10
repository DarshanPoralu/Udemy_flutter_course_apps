import 'package:flutter/material.dart';

class MaterialContent extends StatelessWidget {

  MaterialContent({required this.color, required this.content, required this.onPress});

  final Color color;
  final String content;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      color: color,
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        onPressed: onPress,
        minWidth: 200.0,
        height: 42.0,
        child: Text(
          content,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}