import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final Color _bottomTabColor = Color.fromRGBO(68, 65, 78, 1);

  final String text;
  final bool isSelected;
  final Function onPressed;

  CustomTab({this.text, this.isSelected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 52.0,
        width: 120.0,
        decoration: ShapeDecoration(
          shape: StadiumBorder(side: BorderSide(color: isSelected? Colors.white : Colors.transparent, width: 1.0),
          ),
        ),
        child: Center(
          child: Text(text,
            style: TextStyle(
              fontSize: 16.0, color: isSelected? Colors.white : _bottomTabColor, fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
