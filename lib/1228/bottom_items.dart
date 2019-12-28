import 'package:flutter/material.dart';
import 'package:flutter_on_december/1228/bottom_items_list.dart';

// bottom items container
class BottomItems extends StatelessWidget {
  final int index;
  final bool isSelected;
  final Function onPressed;

  BottomItems({this.index, this.isSelected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 80.0,
        width: 80.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // icon
            Icon(
              items[index].icon,
              size: 28.0,
              color: Colors.grey[300],
            ),

            // text
            isSelected? Text(
              items[index].text,
              style: TextStyle(
                fontSize: 14.0,
                color: items[index].color,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
            ) : Container(),
          ],
        ),
      ),
    );
  }
}
