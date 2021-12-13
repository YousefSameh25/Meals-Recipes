import 'package:flutter/material.dart';
import 'package:meal_app/screens/tabs_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabScreen(),
    );
  }
}
