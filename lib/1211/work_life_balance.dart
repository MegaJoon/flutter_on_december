import 'dart:math';

import 'package:flutter/material.dart';

// https://dribbble.com/shots/8935948/attachments/1091158?mode=media

class WorkLifeBalance extends StatefulWidget {
  @override
  _WorkLifeBalanceState createState() => _WorkLifeBalanceState();
}

class _WorkLifeBalanceState extends State<WorkLifeBalance> {
  // color list
  Color _backgroundColor = Color.fromRGBO(247, 246, 241, 1);

  // double
  double padding = 16.0;
  double radius = 24.0;

  // profile image
  String _image = "https://cdn.pixabay.com/photo/2019/02/20/10/04/penguin-4008872_960_720.jpg";
  String _backgroundImage = "https://cdn.pixabay.com/photo/2019/12/07/14/55/labrador-4679457_960_720.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // set background color
      backgroundColor: _backgroundColor,

      // body
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Column(
          children: <Widget>[
            // appbar
            Container(
//              margin: EdgeInsets.symmetric(horizontal: padding),
              margin: EdgeInsets.only(left: padding, right: padding *2),
              height: 36.0,
              child: Row(
                children: <Widget>[
                  // left icon
                  Icon(Icons.settings, size: 20.0, color: Colors.black),

                  Spacer(),

                  // right icon
                  Container(
                    width: 36.0,
                    child: Stack(
                      children: <Widget>[
                        // circle shape image
                        Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(_image),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                        ),

                        // badges
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            height: 8.0,
                            width: 8.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // text : hello
            RichText(text: TextSpan(children: [
              TextSpan(
                  text: "Hello ",
                  style: TextStyle(
                    fontSize: 40.0, color: Colors.black, fontWeight: FontWeight.w300,
                  ),
              ),

              TextSpan(
                text: "John!",
                style: TextStyle(
                  fontSize: 40.0, color: Colors.black, fontWeight: FontWeight.bold,
                ),
              )
            ]),),

            // text : how is --
            Text("How is your work-life balance this week?",
              style: TextStyle(
                fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w400,
              ),
            ),

            // chart container
            Container(
              margin: EdgeInsets.only(top: padding, left: padding, right: padding),
              height: 80.0,
              child: Stack(
                children: <Widget>[
                  // orange color container
                  Positioned(
                    top: padding,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius /2),
                        color: Colors.deepOrangeAccent.withOpacity(0.70),
                      ),
                      child: Row(
                        children: <Widget>[
                          // chart
                          Container(
                            margin: EdgeInsets.only(right: padding /2),
                            width: 64.0,
                            child: Stack(
                              children: <Widget>[
                                // chart paint
                                Positioned(
                                  top: 32.0,
                                  left: -6.0,
                                  right: 0,
                                  bottom: 0,
                                  child: CustomPaint(
                                    painter: ChartPaint(),
                                  ),
                                ),

                                // center text
                                Positioned.fill(
                                    child: Center(
                                        child: Text(
                                          "80%",
                                          style: TextStyle(
                                            fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                    ),
                                ),
                              ],
                            ),
                          ),

                          // text
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // text
                              Text("Good job John!",
                                style: TextStyle(
                                  fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold,
                                ),
                              ),

                              // text
                              Text("Your life is well-balanced",
                                style: TextStyle(
                                  fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // right image
                  Positioned(
                    top: 0,
                    right: 0,
                    bottom: padding /2,
                    child: Image.network(_backgroundImage, fit: BoxFit.contain, width: 100.0),
                  ),
                ],
              ),
            ),

            // text
            Container(
              margin: EdgeInsets.only(top: padding, left: padding, right: padding),
              height: 40.0,
              child: Row(
                children: <Widget>[
                  // text column
                  Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // text : your tasks
                        Text("Your tasks",
                          style: TextStyle(
                            fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold,
                          ),
                        ),

                        // text : you have 4 tasks for today
                        Text("You have 4 tasks for today",
                          style: TextStyle(
                            fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // calender icon
                  Container(
                    height: 32.0,
                    width: 32.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Icon(Icons.calendar_today, size: 20.0, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // bottom
      bottomNavigationBar: BottomAppBar(
//        shape: CircularNotchedRectangle(),
//        notchMargin: 8.0,
        color: Colors.white,
        elevation: 16.0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: padding),
          height: 64.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.home, size: 24.0, color: Colors.black),
              Icon(Icons.table_chart, size: 24.0, color: Colors.grey[500]),

              SizedBox(width: padding),

              Icon(Icons.calendar_today, size: 24.0, color: Colors.grey[500]),
              Icon(Icons.person_outline, size: 24.0, color: Colors.grey[500]),
            ],
          ),
        ),
      ),

      // floating btn
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("on clicked : Floating btn");
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add, size: 40.0, color: Colors.white),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ChartPaint extends CustomPainter {
  double radius = 20.0;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromCircle(radius: radius, center: Offset(36.0, 0.0));
    double startAngle = 0.0;
    double sweepAngle = pi *2;
    bool useCenter = false;

    var paint = Paint()
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 4.0
    ..isAntiAlias = true
    ..style = PaintingStyle.stroke
    ..color = Color.fromRGBO(235, 122, 77, 1);

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);

    var paint2 = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..color = Colors.white;

    canvas.drawArc(rect, -pi, pi *2 * 0.80, useCenter, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}











