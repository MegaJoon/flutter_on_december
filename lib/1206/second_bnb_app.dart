import 'package:flutter/material.dart';
import 'package:flutter_on_december/1206/sector_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecondBnbApp extends StatefulWidget {
  final int index;

  SecondBnbApp(this.index);

  @override
  _SecondBnbAppState createState() => _SecondBnbAppState();
}

class _SecondBnbAppState extends State<SecondBnbApp> {
  double padding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          // top image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.40,
            child: ClipPath(
              clipper: MyClipper(80.0, 40.0),
              child: Container(
                child: Image.asset(sector[widget.index].image, fit: BoxFit.fill),
              ),
            ),
          ),

          // topRight icon : back
          Positioned(
            top: padding,
            right: padding,
            child: SafeArea(
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(FontAwesomeIcons.sun, size: 24.0, color: Colors.white),
              ),
            ),
          ),

          // indicator
          Positioned(
            top: MediaQuery.of(context).size.height * 0.52,
            left: 0,
            right: 0,
            child: Container(
                height: 36.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: padding / 2),
                      height: 36.0,
                      width: 12.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 1.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: padding / 2),
                      height: 36.0,
                      width: 12.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange, width: 1.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: padding / 2),
                      height: 36.0,
                      width: 12.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber, width: 1.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: padding / 2),
                      height: 36.0,
                      width: 12.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange, width: 1.0),
                      ),
                    ),
                    Container(
                      height: 36.0,
                      width: 12.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 1.0),
                      ),
                    ),
                  ],
                )),

          ),


          // bottom text
          Positioned(
            left: padding,
            right: padding,
            bottom: padding,
            child: Container(
              padding: EdgeInsets.only(top: padding *2),
              height: MediaQuery.of(context).size.height * 0.40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // title
                  Text(sector[widget.index].title,
                    style: TextStyle(
                      fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.w600,
                    ),
                  ),

                  // address
                  Text("Cloud City, Bespin",
                    style: TextStyle(
                      fontSize: 16.0, color: Colors.black12, fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: padding),

                  // user
                  Row(
                    children: <Widget>[
                      // profile image
                      Container(
                        margin: EdgeInsets.only(right: padding/ 2),
                        height: 32.0,
                        width: 32.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage("https://cdn.pixabay.com/photo/2019/12/02/17/44/street-lamp-4668310__340.jpg"),
                            fit: BoxFit.fill,
                          ),
                        ),
//                        child: Placeholder(),
                      ),

                      // hosted by ---
                      Text("Hosted by Landa",
                        style: TextStyle(
                          fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),

                  // subtitle
                  Text(sector[widget.index].subTitle,
                    style: TextStyle(
                      fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: padding *2),

                  // divider
                  Divider(color: Colors.black12),

                  // book now
                  ClipPath(
                    clipper: MyClipper(80.0, 16.0),
                    child: Container(
                      margin: EdgeInsets.only(top: padding),
                      height: 40.0,
                      color: Colors.black,
                      child: Center(
                          child: Text("Book now".toUpperCase(),
                            style: TextStyle(
                              fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600,
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

class MyClipper extends CustomClipper<Path> {
  double boxWidth;
  double boxHeight;

  MyClipper(this.boxWidth, this.boxHeight);

  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(0.0, 0.0)
      ..lineTo(0.0, size.height)
      ..lineTo(size.width - 100.0, size.height)
      ..lineTo(size.width - boxWidth, size.height - boxHeight)
      ..lineTo(size.width, size.height - boxHeight)
      ..lineTo(size.width, 0.0)
      ..lineTo(0.0, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
