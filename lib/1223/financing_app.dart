import 'package:flutter/material.dart';

// https://dribbble.com/shots/9144357-Financing-App/attachments/1195108?mode=media

class FinancingApp extends StatefulWidget {
  @override
  _FinancingAppState createState() => _FinancingAppState();
}

class _FinancingAppState extends State<FinancingApp> {
  // double
  double padding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // main: column
          Positioned.fill(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    Placeholder(),
                    Placeholder(),
                    Placeholder(),
                  ],
                ),
              ),
          ),

          // bottom bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: padding),
              height: 40.0,
              color: Colors.white,
              child: Placeholder(),
            ),
          ),
        ],
      ),
    );
  }
}
