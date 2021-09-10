import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  ReusableWidget({required this.color, required this.cardChild, required this.onPress});
  final Color color;
  final Widget cardChild;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          child: cardChild,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
      ),
    );
  }
}