import 'package:flutter/material.dart';
import 'CalculateandDisplay.dart';
void main() => runApp(Calculate());

class Calculate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: CalculateandDisplay(),
    );
  }
}