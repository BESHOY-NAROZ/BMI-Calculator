import 'dart:ui';

import 'package:bmi_test/input_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ResultsPage extends StatelessWidget {
  String finalResult;
  String finalStatus;

  ResultsPage(this.finalResult, this.finalStatus);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 120),
            child: Text(
              'Your Result',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              padding: EdgeInsets.all(50),
              width: double.infinity,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF282B4E),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    finalStatus.toUpperCase(),
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                  Text(
                    finalResult.toUpperCase(),
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreenAccent),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                  Text(
                    'BESHOO DEVELOPER',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return InputPage();
                  },
                ),
              );
            },
            child: Container(
                padding: EdgeInsets.only(bottom: 5),
                child: Center(
                    child: Text(
                  "RE-CALCULATE",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 50,
                color: Colors.pink),
          ),
        ],
      ),
    );
  }
}
