import 'package:flutter/material.dart';

class BottomTabs extends StatelessWidget {
  final Color _bottomBarColor = Color.fromRGBO(14, 13, 19, 1);
  final Color _bottomTabColor = Color.fromRGBO(68, 65, 78, 1);

  final IconData icon;
  final String text;
  final bool isSelected;
  final Function onPressed;

  BottomTabs({this.icon, this.text, this.isSelected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        height: 48.0,
        width: isSelected? 150.0 : 100.0,
        decoration: ShapeDecoration(
          shape: StadiumBorder(),
          color: isSelected? _bottomTabColor : _bottomBarColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(icon, size: 24.0, color: isSelected? Colors.white : _bottomTabColor),
            isSelected? Text(text, style: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600,),) : Container(),
          ],
        ),
      ),
    );
  }
}
