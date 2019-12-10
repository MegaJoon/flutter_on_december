import 'package:flutter/material.dart';

class ModuleTabs extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final Function onPressed;

  ModuleTabs({this.icon, this.isSelected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    Color _rightColor = Color.fromRGBO(9, 32, 40, 1);
    Color _color = Color.fromRGBO(2, 144, 164, 1);

    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        height: isSelected? 40.0 : 20.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: isSelected? _color : _rightColor,
          boxShadow: isSelected? [BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(2.0, 2.0),
          )] : null,
        ),
        child: Center(
          child: Icon(icon, size: 20.0, color: isSelected? Colors.white : Colors.grey),
        ),
      ),
    );
  }
}
