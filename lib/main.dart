import 'package:flutter/material.dart';
import 'package:food/screens/Home.dart';

void main() {
  runApp(Food());
}

class Food extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Home(),
    );
  }
}
