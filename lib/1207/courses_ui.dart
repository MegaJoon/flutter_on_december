import 'package:flutter/material.dart';

// ??

class CoursesUI extends StatefulWidget {
  @override
  _CoursesUIState createState() => _CoursesUIState();
}

class _CoursesUIState extends State<CoursesUI> {
  // title string
  String title = "Student Panel";

  // padding
  double padding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // keep statusbar height
      body: SafeArea(
          top: true,
          left: true,
          right: true,
          child: Column(
            children: <Widget>[
              // top container : title
              Container(
                height: 100.0,
                child: Center(
                  child: Text(title,
                    style: TextStyle(
                      fontSize: 52.0, color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),

              Flexible(
                // all other size
                fit: FlexFit.tight,
                child: Container(
                  padding: EdgeInsets.only(left: padding, right: padding, bottom: padding),
                  child: GridView.count(
                    padding: EdgeInsets.only(top: padding),
                    shrinkWrap: true,
                    // row count
                      crossAxisCount: 2,
                    childAspectRatio: 1.2 / 1.05,
                    crossAxisSpacing: padding, // spacing between container and container in row
                    mainAxisSpacing: padding,  // spacing between container and container in column
                    children: List.generate(6, (index){
                      return Container(
                        padding: EdgeInsets.all(padding),
                        decoration: BoxDecoration(
                          // shape : circle
                          shape: BoxShape.circle,
                          color: Colors.grey[200],
                          // border lineStyle
                          border: Border.all(color: Colors.black, width: 1.5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            // course {index +1}
                            Text("Course ${(index +1).toString()}",
                              style: TextStyle(
                                fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic,
                              ),
                            ),

                            Spacer(),

                            // mark attendance
                            MaterialButton(
                              onPressed: (){
                                print("on clicked : ${index.toString()} mark attendance");
                              },
                              child: Text("Mark Attendance",
                                style: TextStyle(
                                  fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),

                            // view att.details
                            MaterialButton(
                              onPressed: (){
                                print("on clicked : ${index.toString()} View Att.details");
                              },
                              child: Text("View Att.details",
                                style: TextStyle(
                                  fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );


//                    return Container(
//                      color: Colors.teal,
//                      child: Center(
//                        child: Text(index.toString(),
//                          style: TextStyle(
//                            fontSize: 40.0, color: Colors.black, fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                      ),
//                    );
                    }),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
