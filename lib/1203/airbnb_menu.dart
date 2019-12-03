import 'dart:async';

import 'package:flutter/material.dart';

class AirbnbMenuApp extends StatefulWidget {
  @override
  _AirbnbMenuAppState createState() => _AirbnbMenuAppState();
}

class _AirbnbMenuAppState extends State<AirbnbMenuApp> {
  Color _color = Color.fromRGBO(255, 90, 66, 1);

  bool isSelected = false;

  Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            // appbar
            GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
              child: ClipPath(
                clipper: isSelected? MyClipper() : null,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                  height: isSelected ? 500.0 : 80.0,
                  color: _color,
                  child: Placeholder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path()
      ..lineTo(0.0, 0.0)
      ..lineTo(0.0, size.height * 0.70)
      ..quadraticBezierTo(size.width * 0.15, size.height * 0.705, size.width * 0.30, size.height * 0.74)
      ..quadraticBezierTo(size.width * 0.32, size.height * 0.745, size.width * 0.34, size.height * 0.76)
      ..quadraticBezierTo(size.width * 0.50, size.height, size.width * 0.66, size.height * 0.76)
      ..quadraticBezierTo(size.width * 0.68, size.height * 0.745, size.width * 0.70, size.height * 0.74)
      ..quadraticBezierTo(size.width * 0.85, size.height * 0.705, size.width, size.height * 0.70)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
