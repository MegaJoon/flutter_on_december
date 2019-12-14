import 'package:flutter/material.dart';

// https://www.instagram.com/p/B42WkyxgeJ5/?igshid=bme4t2d6fxc6

class ShoesApp extends StatefulWidget {
  @override
  _ShoesAppState createState() => _ShoesAppState();
}

class _ShoesAppState extends State<ShoesApp> {
  // String
  String title = "Sof Sole Men's\n";
  String title2 = "for active people";

  // double
  double padding = 16.0;
  double radius = 24.0;

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
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1.0,
                          blurRadius: 1.0,
                          offset: Offset(1.0, 1.0),
                        )],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: padding),
                      height: 16.0,
                      width: 16.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1.0,
                          blurRadius: 1.0,
                          offset: Offset(1.0, 1.0),
                        )],
                      ),
                    ),

                    Spacer(),

                    // hour container
                    Container(
                      width: 48.0,
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
//                      child: Placeholder(),
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                              text: "24\n",
                              style: TextStyle(
                                fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "hours",
                              style: TextStyle(
                                fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600,
                              ),
                            ),
                          ]),
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
