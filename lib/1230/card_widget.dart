import 'dart:math';

import 'package:flutter/material.dart';

import 'items_list.dart';

class CardWidget extends StatelessWidget {
  final double index;

  CardWidget(this.index);

  final double padding = 16.0;
  final double radius = 24.0;

  _color(double num){
    switch (num.toInt()){
      case 0:
        return Colors.grey[900];
        break;

      case 1:
        return Colors.grey[700];
        break;

      case 2:
        return Colors.grey[700];
        break;

      case 3:
        return Colors.grey[600];
        break;

      case 4:
        return Colors.grey[600];
        break;

      case 5:
        return Colors.grey[500];
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cards = [];

    for(int i = 0; i < items.length; i++){

      double diff = i - index;

      double positionedRightWidget =
      (diff > 0)? padding * diff * 30.0 : padding * (2 - diff);

      var cardItem = Positioned(
        top: 100.0,
        right: positionedRightWidget,
        bottom: padding * i /2,
        child: Container(
          padding: EdgeInsets.only(
              top: padding * 5,
              left: padding,
              right: padding * 3,
              bottom: padding * 2,
          ),
//          width: 410.0 - padding * 2 * (items.length - i),
          width: 350.0 + padding * 2.0 * diff,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: _color(-diff),
            boxShadow: [BoxShadow(
              color: Colors.black12,
              spreadRadius: 2.0,
              blurRadius: 2.0,
              offset: Offset(2.0, 2.0),
            )]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // text: title
              Text(items[i].text,
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // spacer
              SizedBox(height: 8.0),

              // text: description
              Text(items[i].description,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),

              // spacer
              Spacer(),

              // text: title
              Row(
                children: <Widget>[
                  // text: detail
                  Text("Detail ",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.indigo,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  // icon
                  Icon(
                    Icons.arrow_forward,
                    size: 14.0,
                    color: Colors.indigo,
                  ),
                ],
              ),
            ],
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
