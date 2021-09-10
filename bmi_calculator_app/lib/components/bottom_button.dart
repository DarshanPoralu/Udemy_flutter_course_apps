import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({required this.onPress, required this.text});

  final void Function() onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: kLargeTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}