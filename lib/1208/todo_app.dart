import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// https://www.instagram.com/p/B5v2fHQgnHu/?igshid=botyyqm1207q

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  // padding
  double padding = 16.0;
  double radius = 24.0;

  // string
  String welcome = "Welcome Back!";
  String name = "Dr. Peterson";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // appbar
                Container(
                  margin: EdgeInsets.only(bottom: padding),
                  height: 40.0,
                  child: Row(
                    children: <Widget>[
                      // left icon
                      Icon(Icons.menu, size: 24.0, color: Colors.black),

                      Spacer(),

                      // right icon
                      Icon(Icons.calendar_today, size: 24.0, color: Colors.black),
                    ],
                  ),
                ),

                // text
                Text(welcome,
                  style: TextStyle(
                      fontSize: 20.0, color: Colors.grey, fontWeight: FontWeight.w600,
                  ),
                ),

                Text(name,
                  style: TextStyle(
                      fontSize: 40.0, color: Colors.black, fontWeight: FontWeight.bold,
                  ),
                ),

                // top container
                Container(
                  margin: EdgeInsets.only(top: padding, bottom: padding),
                  height: 250.0,
                  child: Column(
                    children: <Widget>[
                      // blue container
                      Flexible(
                        flex: 5,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding /2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(radius),
                              topRight: Radius.circular(radius),
                            ),
                            color: Colors.blueAccent,
                            boxShadow: [BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1,
                              blurRadius: 1,
                            )],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // appointment request & icon
                              Row(
                                children: <Widget>[
                                  // text : appointment request
                                  Text("Appointment Request",
                                    style: TextStyle(
                                      fontSize: 16.0, color: Colors.white70, fontWeight: FontWeight.w400,
                                    ),
                                  ),

                                  Spacer(),

                                  // icon
                                  Icon(Icons.more_vert, size: 16.0, color: Colors.white70),
                                ],
                              ),

                              // icon & date
                              Row(
                                children: <Widget>[
                                  // icon
                                  Icon(Icons.watch_later, size: 20.0, color: Colors.white),

                                  SizedBox(width: padding /2),

                                  // text : date
                                  Text("12 Jan 2020, 8am - 10am",
                                    style: TextStyle(
                                      fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w600,
                                    ),
                                  ),


                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      // white container
                      Flexible(
                        flex: 9,
                        child: Container(
                          padding: EdgeInsets.all(padding),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(radius),
                              bottomRight: Radius.circular(radius),
                            ),
                            color: Colors.white,
                            boxShadow: [BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1,
                              blurRadius: 1,
                            )],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              // user profile
                              Row(
                                children: <Widget>[
                                  // profile image
                                  Container(
                                    margin: EdgeInsets.only(right: padding),
                                    height: 64.0,
                                    width: 64.0,
                                    decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(radius /1.5),
                                     image: DecorationImage(
                                       image: NetworkImage("https://cdn.pixabay.com/photo/2019/12/04/13/12/hair-4672683__340.jpg"),
                                       fit: BoxFit.fill,
                                     ),
                                    ),
//                                    child: Placeholder(),
                                  ),

                                  // name
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        // text : name
                                        Text("Louis",
                                          style: TextStyle(
                                            fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600,
                                          ),
                                        ),

                                        Text("Patterson",
                                          style: TextStyle(
                                            fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // icon
                                  Container(
                                    height: 32.0,
                                    width: 32.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.grey[300], width: 1.0),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                        child: Icon(
                                            FontAwesomeIcons.info, size: 16.0, color: Colors.blueAccent,
                                        ),
                                    ),
                                  ),
                                ],
                              ),

                              // accept / decline contaienr
                              Container(
                                height: 40.0,
                                child: Row(
                                  children: <Widget>[
                                    // accept
                                    Flexible(
                                      flex: 2,
                                      child: Container(
                                        decoration: ShapeDecoration(
                                          shape: StadiumBorder(),
                                          color: Colors.blueAccent,
                                        ),
                                        child: Center(
                                          child: Text("Accept".toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: padding),

                                    // decline
                                    Flexible(
                                      child: Container(
                                      decoration: ShapeDecoration(
                                        shape: StadiumBorder(),
                                        color: Colors.grey[300],
                                      ),
                                      child: Center(
                                        child: Text("Decline".toUpperCase(),
                                          style: TextStyle(
                                            fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ),
                                  ],
                                )
                              ),
                            ],
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
