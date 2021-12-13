import 'package:flutter/material.dart';
import 'package:meal_app/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(255, 254, 229, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(255, 254, 229, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
