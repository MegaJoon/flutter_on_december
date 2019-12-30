import 'dart:math';

import 'package:flutter/material.dart';

import 'items_list.dart';

class CardWidget extends StatelessWidget {
  final double index;

  CardWidget(this.index);

  final double padding = 16.0;

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = [];

    int cnt = (items.length - index.floor() > 3)? 3 : items.length - index.floor();
    for(int i = 0; i < cnt; i++){
      double scrollPosition = index - index.floor();
      double marginX = padding * (2 - i);
      double positionRight = scrollPosition * padding * 30.0;

      var cardItem = Positioned(
        top: 0,
        right: padding * (i + 2),
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: marginX, left: marginX, right: positionRight),
            height: 300.0,
            width: 300.0 + marginX,
            color: Colors.blue.withOpacity(0.50),
            child: Center(
              child: Text(items[index.toInt() + i],
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );

      cards.add(cardItem);
    }

    return Stack(
      children: cards,
    );
  }
}
