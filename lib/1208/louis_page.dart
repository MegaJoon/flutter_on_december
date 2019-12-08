import 'package:flutter/material.dart';

// https://www.instagram.com/p/B5v2fHQgnHu/?igshid=botyyqm1207q

// second page

class LouisPage extends StatefulWidget {
  @override
  _LouisPageState createState() => _LouisPageState();
}

class _LouisPageState extends State<LouisPage> {
  // padding
  double padding = 16.0;

  // string
  String title = "Appointment Request";
  //
  String date = "12 Jan 2020,\n8am - 10am";
  String name = "Louis\nPatterson";
  String comment = "Hello, Dr. Peterson,\nI'm going to bring my complete blood\ncount analysis with me";
  //
  String _image = "https://cdn.pixabay.com/photo/2019/12/04/13/12/hair-4672683__340.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          // background blue container
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.60,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(120.0),
                ),
                color: Colors.blueAccent,
              ),
            ),
          ),

          // appbar
          Positioned(
            top: 0,
            left: padding,
            right: padding,
            child: SafeArea(
              child: Container(
                height: 40.0,
                child: Row(
                  children: <Widget>[
                    // left icon
                    Icon(Icons.arrow_back, size: 24.0, color: Colors.white),

                    // text: title
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        padding: EdgeInsets.only(left: padding *2),
                          child: Text(title,
                            style: TextStyle(
                              fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w400,
                            ),
                          ),
                      ),
                    ),

                    // right icon
                    Icon(Icons.more_vert, size: 24.0, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),

          // main column
          Positioned(
            top: 100.0,
            left: 64.0,
            right: 64.0,
            bottom: 100.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // text : date
                Text(date,
                  style: TextStyle(
                    fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.bold,
                  ),
                ),

                // profile
                Container(
                  margin: EdgeInsets.only(top: padding),
                  height: 100.0,
                  child: Row(
                    children: <Widget>[
                      // profile iamge
                      Container(
                        margin: EdgeInsets.only(right: padding),
                        padding: EdgeInsets.all(8.0),
                        width: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: Colors.white,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image: NetworkImage(_image),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),

                      // call icon center
                      Container(
                        height: 64.0,
                        width: 64.0,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.lightBlueAccent,
                            ),
                            child: Center(
                                child: Icon(
                                    Icons.call, size: 24.0, color: Colors.white,
                                ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // text : name
                Text(name,
                  style: TextStyle(
                    fontSize: 36.0, color: Colors.black, fontWeight: FontWeight.bold,
                  ),
                ),

                // title : comment
                Text("Comment:",
                  style: TextStyle(
                    fontSize: 14.0, color: Colors.grey, fontWeight: FontWeight.w600,
                  ),
                ),

                // text : comment
                Text(comment,
                  style: TextStyle(
                    fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),

                // attached file
                Container(
                  padding: EdgeInsets.symmetric(vertical: padding /2),
                  height: 64.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                    ),
                    color: Colors.lightBlueAccent.withOpacity(0.1),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // index
                      Container(
                        width: 2.5,
                        color: Colors.lightBlueAccent,
                      ),

                      SizedBox(width : padding /2),

                      // file icon
                      Icon(Icons.attach_file, size: 20.0, color: Colors.lightBlueAccent),

                      SizedBox(width : padding /2),

                      //
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // text : complete blood count
                          Text("Complete blood count",
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600,
                            ),
                          ),

                          // text : date
                          Text("05 Mar 2020",
                            style: TextStyle(
                              fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),

          // bottom container
          Positioned(
            left: padding,
            right: padding,
            bottom: padding,
            child: Container(
              height: 48.0,
              child: Row(
                children: <Widget>[
                  // accept container
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

                  // decline container
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
