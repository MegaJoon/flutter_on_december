import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_on_december/1207/banking/bottom_tabs.dart';
import 'package:flutter_on_december/1207/banking/myTab.dart';

// https://dribbble.com/shots/8801556-Skeuomorph-Banking-App/attachments/1014186?mode=media

class BankingApp extends StatefulWidget {
  @override
  _BankingAppState createState() => _BankingAppState();
}

class _BankingAppState extends State<BankingApp> {
  List<Widget> pages;

  double padding = 16.0; // padding

  int _currentIndex = 2; // bottom index

  // bottom index Function
  void _onPressed(int num) {
    setState(() {
      _currentIndex = num;
    });
  }

  // tab index
  int _selectedIndex = 0;

  // tab index Function
  void _onTabPressed(int num){
    setState(() {
      _selectedIndex = num;
    });
  }
  @override
  Widget build(BuildContext context) {
    _definePages();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Column(
          children: <Widget>[
            //
            Flexible(
              fit: FlexFit.tight,
              child: pages[_currentIndex],
            ),

            // bottombar
            Container(
              padding: EdgeInsets.symmetric(horizontal: padding),
              margin: EdgeInsets.symmetric(vertical: padding /2),
              height: 64.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BottomTabs(
                      icon: Icons.home,
                      isBadge: false,
                      isSelected: _currentIndex == 0,
                      onPressed: () {
                        _onPressed(0);
                      }),

                  BottomTabs(
                      icon: Icons.credit_card,
                      isBadge: false,
                      isSelected: _currentIndex == 1,
                      onPressed: () {
                        _onPressed(1);
                      }),

                  BottomTabs(
                      icon: Icons.show_chart,
                      isBadge: false,
                      isSelected: _currentIndex == 2,
                      onPressed: () {
                        _onPressed(2);
                      }),

                  BottomTabs(
                      icon: Icons.notifications,
                      isBadge: true,
                      isSelected: _currentIndex == 3,
                      onPressed: () {
                        _onPressed(3);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _definePages(){
    pages = [
      // dont use
      Placeholder(color: Colors.red),
      Placeholder(color: Colors.amber),

      // initial page
      Padding(
        padding: EdgeInsets.only(left: padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // appbar
            Container(
              padding: EdgeInsets.only(right: padding),
              margin: EdgeInsets.only(bottom: padding),
              height: 52.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // left icon
                  Container(
                    height: 52.0,
                    width: 52.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.grey[200],
                      boxShadow: [BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(2.0, 2.0),
                      )],
                    ),
                    child: Center(
                      child: Icon(Icons.arrow_back, size: 28.0, color: Colors.grey),
                    ),
                  ),

                  // right icon
                  Container(
                    height: 52.0,
                    width: 52.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.grey[200],
                      boxShadow: [BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(2.0, 2.0),
                      )],
                    ),
                    child: Center(
                      child: Icon(Icons.menu, size: 28.0, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),

            // text : History
            Text("History",
              style: TextStyle(
                fontSize: 36.0, color: Colors.black, fontWeight: FontWeight.bold,
              ),
            ),

            // tabs
            Container(
              margin: EdgeInsets.only(bottom: padding),
              height: 52.0 + 4.0 + padding,
              child: ListView(
                padding: EdgeInsets.only(top: padding, left: 4.0, bottom: 4.0),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  MyTab(text: "Today", isSelected: _selectedIndex == 0, onPressed: (){_onTabPressed(0);},),
                  MyTab(text: "Yesterday", isSelected: _selectedIndex == 1, onPressed: (){_onTabPressed(1);},),
                  MyTab(text: "Monday", isSelected: _selectedIndex == 2, onPressed: (){_onTabPressed(2);},),
                  MyTab(text: "Wednesday", isSelected: _selectedIndex == 3, onPressed: (){_onTabPressed(3);},),
                ],
              ),
            ),

            // tabbarview == pie chart
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                margin: EdgeInsets.only(right: padding),
                child: Stack(
                  children: <Widget>[
                    // pie chart
                    Positioned.fill(
                        child: Container(
                          width: 200.0,
                          child: CustomPaint(
                            painter: MyPaint(),
                          ),
                        ),
                    ),

                    // food 30%
                    Positioned(
                      left: 0,
                      bottom: padding *2.5,
                      child: Container(
                        height: 44.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.grey[200],
                          boxShadow: [BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(2.0, 2.0),
                          )],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(Icons.restaurant_menu, size: 18.0, color: Colors.black),
                            Text("30% (Food)",
                              style: TextStyle(
                                fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // shopw my transactions container
            Container(
              margin: EdgeInsets.only(top: padding, right: padding, bottom: padding),
              height: 44.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.grey[200],
                boxShadow: [BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(2.0, 2.0),
                )],
              ),
              child: Center(
                child: Text("Show my transactions",
                  style: TextStyle(
                    fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // dont use
      Placeholder(color: Colors.deepPurple),
    ];
  }
}

// draw pie chart
class MyPaint extends CustomPainter {
  double boxWidth = 200.0;  // container width
  double boxHeight = 200.0;  // container height
  double strokeWidth = 100.0;  // line width

  // color list
  List<Color> _colorList = [
    Colors.green,
    Colors.lightBlueAccent,
    Colors.red,
    Colors.orangeAccent,
    Colors.yellowAccent];

  // for : cnt
  int cnt = 0;

  // convert degree => radian
  double radToDeg(double angle){
    return angle * pi / 180.0;
  }

  // drawArc Function
  void drawArcWithRadius(Canvas canvas, Offset center, double radius, double startAngle, double endAngle, Paint paint) {
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), radToDeg(startAngle), radToDeg(endAngle), false, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    // basic circle
    Rect rect = Rect.fromLTWH(boxWidth /2 - 16.0, boxHeight /3.5, boxWidth, boxHeight);

    canvas.drawArc(
        rect,
        0.0,
        pi * 2,
        false,
        Paint()
          ..color = Colors.grey[100]
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke);

    // a part of circle
    for (double i = 0.0; i < 360.0; i += (360.0 / 5)) {
      Offset center = Offset(boxWidth - 16.0, boxHeight / 1.3);
      double radius = boxWidth / 2;

      double startAngle = i;
      double endAngle = -80.0;

//      print("$cnt번째 원 ^^^^^^^^^ i = $i, cnt = $cnt, startAngle = $startAngle, endAngle = $endAngle");

      Paint paint = Paint()
        ..strokeCap = StrokeCap.round
        ..strokeWidth = strokeWidth * 0.50
        ..style = PaintingStyle.stroke
        ..isAntiAlias = true
        ..color = _colorList[cnt].withOpacity(0.95);

      // start to draw
      drawArcWithRadius(canvas, center, radius, startAngle, endAngle, paint);

      canvas.save();
      canvas.restore();

      cnt++;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

