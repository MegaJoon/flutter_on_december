import 'dart:math';

import 'package:flutter/material.dart';

// https://www.instagram.com/p/B42WkyxgeJ5/?igshid=bme4t2d6fxc6

class ShoesApp extends StatefulWidget {
  @override
  _ShoesAppState createState() => _ShoesAppState();
}

class _ShoesAppState extends State<ShoesApp> with SingleTickerProviderStateMixin {
  // String
  String title = "Sof Sole Men's\n";
  String title2 = "for active people";
  String _image = "assets/1214/image.png";

  // double
  double padding = 16.0;
  double radius = 24.0;

  // color
  Color _color = Color.fromRGBO(224, 65, 145, 1);

  // animation
  AnimationController _controller;
  Animation<double> animation;

  @override
  void initState() {
    _controller = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: pi *2).animate(_controller)
    ..addListener((){
      setState(() {
      });
    })
    ..addStatusListener((status){
      if(status == AnimationStatus.completed){
        _controller.repeat();
      }
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background color
      backgroundColor: Color.fromRGBO(255, 246, 239, 1),

      // body
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Container(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // text : title
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: title,
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: title2,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ]),
              ),

              // color circle container
              Container(
                padding: EdgeInsets.only(top: padding),
                height: 64.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // circle contaienr
                    Container(
                      margin: EdgeInsets.only(right: padding),
                      height: 16.0,
                      width: 16.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1.0,
                            blurRadius: 1.0,
                            offset: Offset(1.0, 1.0),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: padding),
                      height: 16.0,
                      width: 16.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1.0,
                            blurRadius: 1.0,
                            offset: Offset(1.0, 1.0),
                          )
                        ],
                      ),
                    ),

                    Spacer(),

                    // hour container
                    Container(
                      width: 48.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius / 2),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1.0,
                            blurRadius: 1.0,
                            offset: Offset(1.0, 1.0),
                          )
                        ],
                      ),
//                      child: Placeholder(),
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                              text: "24\n",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "hours",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // main box
              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  margin: EdgeInsets.only(top: padding),
                  child: Stack(
                    children: <Widget>[
                      // image
                      Positioned.fill(
                          child: Image.asset(
                            _image,
                            fit: BoxFit.contain,
                          ),
                      ),

                      // wave container
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 100.0,
                          width: 64.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius /2),
                            color: Colors.white,
                            boxShadow: [BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1.0,
                              blurRadius: 1.0,
                              offset: Offset(1.0, 1.0),
                            )],
                          ),
                          child: Stack(
                            children: <Widget>[
                              // wave color container
                              Positioned(
                                top: 100 * 0.20,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: ClipPath(
                                  clipper: WaveClipper(animation.value),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(radius /2),
                                        bottomRight: Radius.circular(radius /2),
                                      ),
                                      color: _color,
                                    ),
                                  ),
                                ),
                              ),

                              // text
                              Positioned.fill(
                                child: Center(
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(children: [
                                      // text : 85%
                                      TextSpan(text: "85%\n",
                                        style: TextStyle(
                                          fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      // text : Comfort
                                      TextSpan(text: "Comfort",
                                        style: TextStyle(
                                          fontSize: 10.0, color: Colors.white, fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ]),
                                  ),
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

              // price container
              Container(
                height: 64.0,
                child: Row(
                  children: <Widget>[
                    // text : price
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "\$93.89\n",
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "Total",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ]),
                    ),

                    Spacer(),

                    // icon in container; btn
                    GestureDetector(
                      onTap: (){
                        print("on clicked : move next page");
                      },
                      child: Container(
                        width: 64.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius /2),
                          color: Colors.black,
                        ),
                        child: Center(
                          child: Icon(Icons.arrow_forward_ios, size: 24.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double animationValue;

  WaveClipper(this.animationValue);

  _positionY(double deg){
    return (cos(deg + animationValue) - 1.0) * (-4.0);
  }

  // 1 0
  // 0 4
  // -1 8
  @override
  Path getClip(Size size) {
    var path = Path()

        ..lineTo(0.0, _positionY(0))
        ..lineTo(0.0, size.height)
        ..lineTo(size.width, size.height)
        ..lineTo(size.width, _positionY(pi))
        ..lineTo(size.width * 0.75, _positionY(pi * 0.75))
        ..lineTo(size.width * 0.50, _positionY(pi * 0.50))
        ..lineTo(size.width * 0.25, _positionY(pi * 0.25))
        ..lineTo(0.0, _positionY(0))
        ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

























