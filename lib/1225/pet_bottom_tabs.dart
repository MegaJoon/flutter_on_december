import 'package:flutter/material.dart';

class PetsBottomTabs extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final Function onPressed;

  PetsBottomTabs({this.icon, this.text, this.isSelected, this.onPressed});

  final Color _color = Color.fromRGBO(57, 105, 111, 1);
  final double radius = 16.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        curve: Curves.fastOutSlowIn,
        width: isSelected? 140.0 : 64.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: isSelected? _color : Colors.grey[200],
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // icon
              Icon(
                icon,
                size: 20.0,
                color: isSelected? Colors.white : _color,
              ),

              // text
              isSelected? Text(text,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
