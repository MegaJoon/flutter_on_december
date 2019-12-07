import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onPressed;

  MyTab({this.text, this.isSelected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    double padding = 16.0;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(right: padding *2),
        height: 52.0,
        width: 130.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.grey[200],
          boxShadow: [BoxShadow(
            color: isSelected? Colors.black26 : Colors.black12,
            spreadRadius: 2,
            blurRadius: 2,
            offset: isSelected? Offset(-2.0, -2.0) : Offset(2.0, 2.0),
          )],
        ),
        child: Center(
          child: Text(text,
            style: TextStyle(
              fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
