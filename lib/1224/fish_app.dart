import 'package:flutter/material.dart';

// https://dribbble.com/shots/9146113-Fishing

class FishApp extends StatefulWidget {
  @override
  _FishAppState createState() => _FishAppState();
}

class _FishAppState extends State<FishApp> {
  // color list
  Color _backgroundColor = Color.fromRGBO(236, 245, 253, 1);
  Color _color = Color.fromRGBO(27, 175, 223, 1);

  // image
  String _logoImage = "assets/1224/fish_icon.png";

  // double
  double padding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          // left container: tabbar
          Container(
            width: 80.0,
            color: _backgroundColor,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Column(
                children: <Widget>[
                  // app icon
                  Container(
                    padding: EdgeInsets.all(padding /2),
                    height: 48.0,
                    child: Image.asset(
                      _logoImage,
                      fit: BoxFit.fill,
                      color: _color,
                    ),
                  ),

                  // tabs
                  
                ],
              ),
            ),
          ),

          // right container: tabbar view
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              child: Placeholder(),
            ),
          ),
        ],
      ),
    );
  }
}
