import 'package:flutter/material.dart';

// second christmas box app;

class SecondChristmasApp extends StatefulWidget {
  @override
  _SecondChristmasAppState createState() => _SecondChristmasAppState();
}

class _SecondChristmasAppState extends State<SecondChristmasApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // main column
          Positioned.fill(
              child: Placeholder(),
          ),

          // bottom bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 64.0,
              child: Placeholder(),
            ),
          ),
        ],
      ),
    );
  }
}
