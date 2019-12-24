import 'package:flutter/material.dart';

// https://dribbble.com/shots/7170795-Cake-Studio-App

class CakeApp extends StatefulWidget {
  @override
  _CakeAppState createState() => _CakeAppState();
}

class _CakeAppState extends State<CakeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // top container
          Flexible(
            child: Stack(
              children: <Widget>[
                // background image
                

              ],
            ),
          ),

          // bottom container
          Flexible(
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
