import 'package:flutter/material.dart';

// tabs

class FoodTabs extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final Function onPressed;

  FoodTabs({this.icon, this.text, this.isSelected, this.onPressed});

  final double padding = 16.0;
  final double radius = 24.0;

  final Color _color = Color.fromRGBO(243, 136, 38, 1);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(left: padding),
        width: 64.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius /2),
          color: isSelected? _color : Colors.white,
          boxShadow: [BoxShadow(
            color: Colors.black12,
            spreadRadius: 1.0,
            blurRadius: 5.0,
          )],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // icon
            Icon(icon, size: 32.0, color: isSelected? Colors.white : Colors.grey),

            isSelected? SizedBox(height: 2.0) : Container(),

            // text
            isSelected? Text(text,
              style: TextStyle(
                fontSize: 8.0, color: Colors.white, fontWeight: FontWeight.bold,
              ),
            ) : Container(),
          ],
        ),
      ),
    );
  }
}
