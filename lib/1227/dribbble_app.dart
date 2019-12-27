import 'package:flutter/material.dart';

// https://www.instagram.com/p/B4zxyKZH3MC/?igshid=13eygjupzu5u9

class DribbbleApp extends StatefulWidget {
  @override
  _DribbbleAppState createState() => _DribbbleAppState();
}

class _DribbbleAppState extends State<DribbbleApp> with SingleTickerProviderStateMixin {
  // string
  String title = "dribbble";
  List<String> text = [
    "hello",
    "hola",
    "Coyioun",
  ];

  // image
  String _logo = "assets/1226/dribbble.png";
  
  // color
  Color _color = Color.fromRGBO(195, 35, 95, 1);

  // cnt
  int cnt = 0;

  // animation
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        duration: Duration(milliseconds: 500),
    vsync: this)
    ..forward();

    _animation = Tween<double>(begin: 0.0, end: 60.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.fastOutSlowIn,
      ),
    )
    ..addListener((){
      setState(() {
      });
    })
    ..addStatusListener((status){
      if(status == AnimationStatus.dismissed)
        _controller.forward();
      else if(status == AnimationStatus.completed)
        _controller.reverse();

      // cnt++
      if(status == AnimationStatus.dismissed){
        cnt++;
        print("cnt = $cnt");
      }
    });
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
      body: Stack(
        children: <Widget>[
          // appbar: title
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Center(
                child: Text(title,
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Election Script",

                  ),
                ),
              ),
            ),
          ),

          // image
          Positioned(
            top: 250.0 - _animation.value,
            left: 0,
            right: 0,
            height: 100.0,
            child: Image.asset(
              _logo,
              fit: BoxFit.contain,
            ),
          ),
          
          // image shadow
          Positioned(
            top: 350.0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 4.0,
                width: 40.0 - _animation.value / 2.5,
                decoration: ShapeDecoration(
                  shape: StadiumBorder(),
                  color: _color,
                ),
              ),
            ),
          ),

          // text
          Positioned(
            left: 0,
            right: 0,
            bottom: 200.0,
            height: 100.0,
            child: Center(
              child: Text(
//                cnt.toString(),
                text[cnt %3],
                style: TextStyle(
                  fontSize: 100.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Election Script",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

















