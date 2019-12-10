import 'package:flutter/material.dart';

class ProductTabs extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onPressed;

  ProductTabs({this.text, this.isSelected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    double padding = 16.0;

    Color _color = Color.fromRGBO(5, 145, 166, 1);
    Color _containerColor = Color.fromRGBO(12, 32, 41, 1);

    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
        margin: EdgeInsets.only(right: padding),
        height: 32.0,
        width: isSelected? 100.0 : 72.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: isSelected? _containerColor : Colors.white,
          boxShadow: isSelected? [BoxShadow(
            color: _color.withOpacity(0.50),
            spreadRadius: 1,
            blurRadius: 1,
          )] : null,
        ),
        child: Center(
          child: Text(text,
            style: TextStyle(
              fontSize: 14.0, color: isSelected? Colors.white : Colors.grey[500], fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
