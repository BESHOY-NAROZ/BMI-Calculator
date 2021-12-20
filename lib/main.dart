import 'package:flutter/material.dart';

import 'input_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
//      ThemeData(
//          primaryColor: Color(0xFF272B4D),
//          scaffoldBackgroundColor: Color(0xFF105983),
//          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.blueAccent))),
    );
  }
}
