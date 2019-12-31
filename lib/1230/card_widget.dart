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

    for(int i = 0; i < items.length; i++){

      double diff = i - index;

      double positionedRightWidget = (diff > 0)? padding * diff * 30.0 : padding /2 * (items.length - i);

      double positionedMargin = padding * (1 - diff);

      var cardItem = Positioned(
        top: 0,
        right: positionedRightWidget,
        bottom: padding * i,

        child: Container(
          width: 410.0 - padding * (items.length - i),
          color: Colors.tealAccent.withOpacity(0.40),
          child: Center(
            child: Text(items[i],
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
      cards.add(cardItem);
    }
    return Stack(
        children: cards
    );
  }
}
