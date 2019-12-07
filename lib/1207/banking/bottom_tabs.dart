import 'package:flutter/material.dart';

class BottomTabs extends StatelessWidget {
  final IconData icon;
  final bool isBadge;
  final bool isSelected;
  final Function onPressed;

  BottomTabs({this.icon, this.isBadge, this.isSelected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.0,
      width: 52.0,
      child: Stack(
        children: <Widget>[
          // normal
          Positioned(
            top: 6.0,
            left: 0,
            right: 0,
            bottom: 6.0,
            child: GestureDetector(
              onTap: onPressed,
              child: Container(
                height: 52.0,
                width: 52.0,
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
                  child: Icon(icon, size: 28.0, color: Colors.grey),
                ),
              ),
            ),
          ),

          // badges
          isBadge? Positioned(
            top: 4.0,
            left: 0.0,
            child: Container(
              height: 20.0,
              width: 20.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
                boxShadow: [BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: isSelected? Offset(-2.0, -2.0) : Offset(2.0, 2.0),
                )],
              ),
              child: Center(
                child: Text("1",
                  style: TextStyle(
                    fontSize: 10.0, color: Colors.black, fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ) : Container(),
        ],
      ),
    );
  }
}
