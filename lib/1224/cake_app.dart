import 'package:flutter/material.dart';

// https://dribbble.com/shots/7170795-Cake-Studio-App

class CakeApp extends StatefulWidget {
  @override
  _CakeAppState createState() => _CakeAppState();
}

class _CakeAppState extends State<CakeApp> {
  // double
  double radius = 24.0;
  double padding = 16.0;
  
  // color
  Color _color = Color.fromRGBO(253, 127, 165, 1);
  
  // image
  String _backgroundImage = "assets/1224/backgroundImage.jpg";
  String _iconImage = "assets/1224/icon.png";
  String _iconImage1 = "assets/1224/icon1.png";
  String _iconImage2 = "assets/1224/icon2.png";

  
  // text
  String text = "How would you\nlike to order?";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // top continaer
          Flexible(
            child: Stack(
              children: <Widget>[
                // background image
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 60.0,
                  child: Placeholder(),
                ),

                // bottom boxes
                Positioned(
                  left: padding,
                  right: padding,
                  bottom: 20.0,
                  child: Container(
                    height: 80.0,
                    child: Placeholder(),
                  ),
                ),

                // appbar
                Positioned(
                  top: 0,
                  left: padding,
                  right: padding,
                  child: Container(
                    height: 220.0,
                    child: Placeholder(),
                  ),
                ),
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
