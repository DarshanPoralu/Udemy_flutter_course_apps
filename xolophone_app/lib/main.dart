import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({int buttonNumber = 0, Color color = Colors.black}){
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(buttonNumber);
        },
        child: Text('',),
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(buttonNumber: 1, color: Colors.red),
              buildKey(buttonNumber: 2, color: Colors.brown),
              buildKey(buttonNumber: 3, color: Colors.purple),
              buildKey(buttonNumber: 4, color: Colors.green),
              buildKey(buttonNumber: 5, color: Colors.blue),
              buildKey(buttonNumber: 6, color: Colors.pink),
              buildKey(buttonNumber: 7, color: Colors.yellow),
            ],
          ),
        ),
      ),
    );
  }
}
