import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: Center(child: Text('I am Poor')),
          backgroundColor: Colors.amberAccent,
        ),
        body: Center(
          child: Image(
              image: AssetImage('images/OIP.png'),
          ),
        ),
      ),
  ));
}


