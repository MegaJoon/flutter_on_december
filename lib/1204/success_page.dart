import 'package:flutter/material.dart';

// https://dribbble.com/shots/5315437-Great-Success

class SuccessPage extends StatefulWidget {
  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  String _image = "assets/1204/great_success_animation.gif";

  double padding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: padding *2),
        child: Image.asset(_image, fit: BoxFit.contain),
      ),
    );
  }
}
