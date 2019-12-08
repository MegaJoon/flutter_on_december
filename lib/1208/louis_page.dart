import 'package:flutter/material.dart';

// https://www.instagram.com/p/B5v2fHQgnHu/?igshid=botyyqm1207q

// second page

class LouisPage extends StatefulWidget {
  @override
  _LouisPageState createState() => _LouisPageState();
}

class _LouisPageState extends State<LouisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // top
            Flexible(
              flex: 5,
              child: Placeholder(),
            ),

            // bottom
            Flexible(
              flex: 7,
              child: Placeholder(),
            ),
          ],
        ),
      ),
    );
  }
}
