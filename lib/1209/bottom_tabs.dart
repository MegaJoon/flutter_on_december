import 'package:flutter/material.dart';

class BottomTabs extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final Function onPressed;

  BottomTabs({this.icon, this.text, this.isSelected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn,
        height: 40.0,
        width: isSelected? 120.0 : 110.0,
        decoration: ShapeDecoration(
          shape: StadiumBorder(),
          color: isSelected? Colors.grey[200] : Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // icon
            Icon(icon, size: 24.0, color: Colors.black),

            // text
            isSelected? Text(text,
              style: TextStyle(
                fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.bold,
              ),
            ) : Container(),
          ],
        ),
      ),
    );
  }
}
