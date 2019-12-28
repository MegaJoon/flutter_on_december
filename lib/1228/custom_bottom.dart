import 'package:flutter/material.dart';
import 'package:flutter_on_december/1228/bottom_items.dart';
import 'package:flutter_on_december/1228/bottom_items_list.dart';

// https://www.pinterest.co.kr/pin/395050198579811531/

class CustomBottom extends StatefulWidget {
  @override
  _CustomBottomState createState() => _CustomBottomState();
}

class _CustomBottomState extends State<CustomBottom> {
  // list<widget>
  List<Widget> pages;

  // double
  double padding = 16.0;
  double _circlePadding = 4.0;

  // floating btn width
  double boxWidth = 80.0;

  // floating btn moving distance init
  double positionX = 16.0;

  // bottom index
  int currentIndex = 0;

  // bottom tabs Function
  void _onPressed(int num){
    setState(() {
      // set index
      currentIndex = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    // space == spacer between boxWidth in bottom container
    double space = (MediaQuery.of(context).size.width - padding *2 - boxWidth *4) /3;

    // floating btn moving distance
    positionX = padding + (boxWidth + space) * currentIndex;

    // set widget pages;
    setPages();

    return Scaffold(
      // set background color
      backgroundColor: items[currentIndex].color.withOpacity(0.80),

      body: Stack(
        children: <Widget>[
          // main box
          Positioned.fill(
              child: pages[currentIndex],
          ),

          // bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: boxWidth + 28.0,
            child: Stack(
              children: <Widget>[
                // white box
                Positioned(
                  top: boxWidth / 2,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        BottomItems(
                          index: 0,
                          isSelected: currentIndex == 0,
                          onPressed: (){
                            _onPressed(0);
                          },
                        ),

                        BottomItems(
                          index: 1,
                          isSelected: currentIndex == 1,
                          onPressed: (){
                            _onPressed(1);
                          },
                        ),

                        BottomItems(
                          index: 2,
                          isSelected: currentIndex == 2,
                          onPressed: (){
                            _onPressed(2);
                          },
                        ),

                        BottomItems(
                          index: 3,
                          isSelected: currentIndex == 3,
                          onPressed: (){
                            _onPressed(3);
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // moving floating btn
                AnimatedPositioned(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  top: 0,
                  left: positionX,
                  child: Container(
                    padding: EdgeInsets.all(_circlePadding),
                    height: boxWidth,
                    width: boxWidth,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: items[currentIndex].color,
                      ),
                      child: Center(
                        child: Icon(
                          items[currentIndex].icon,
                          size: 40.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // widget pages;
  setPages(){
    pages = [
      // initial page
      Placeholder(color: items[0].color),

      // --
      Placeholder(color: items[1].color),
      Placeholder(color: items[2].color),
      Placeholder(color: items[3].color),
    ];
  }
}
