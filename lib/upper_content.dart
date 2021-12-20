import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpperContent extends StatelessWidget {
  final IconData icon;
  final String text;

  UpperContent(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.cyanAccent),
        )
      ],
    );
  }
}
