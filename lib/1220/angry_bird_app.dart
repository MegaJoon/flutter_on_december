import 'package:flutter/material.dart';
import 'package:flutter_on_december/1209/movie_list.dart';
import 'package:flutter_on_december/1220/angry_birds2_app.dart';
import 'package:flutter_on_december/1220/movie_list.dart';

// https://dribbble.com/shots/2746450-Animation-Test-Part-3-DateNight-App#

class AngryBirdsApp extends StatefulWidget {
  @override
  _AngryBirdsAppState createState() => _AngryBirdsAppState();
}

class _AngryBirdsAppState extends State<AngryBirdsApp> {
  // color
  Color _backgroundColor = Color.fromRGBO(71, 158, 252, 1);
  Color _textFieldColor = Color.fromRGBO(31, 118, 247, 1);

  // string text
  String title = "Movies";

  // double
  double padding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // set background color
      backgroundColor: _backgroundColor,

      // body: placeholder
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // appbar
              Container(
                height: 40.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // left icon
                    IconButton(
                      onPressed: (){},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 24.0,
                        color: Colors.white,
                      ),
                    ),

                    // text: title
                    Text(title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // spacer
                    Container(
                      height: 40.0,
                      width: 48.0,
//                    child: Placeholder(),
                    ),
                  ],
                ),
              ),

              // textfield
              Container(
                margin: EdgeInsets.only(
                    top: padding,
                    left: padding *4,
                    right: padding *4,
                ),
                padding: EdgeInsets.symmetric(horizontal: padding),
                height: 40.0,
                decoration: ShapeDecoration(
                  shape: StadiumBorder(),
                  color: _textFieldColor,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // left icon
                    prefixIcon: Icon(
                      Icons.search,
                      size: 16.0,
                      color: Colors.grey,
                    ),

                    // hint text
                    hintText: "Search Movie or Theater",
                    hintStyle: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300,
                    ),

                    //
                    contentPadding: EdgeInsets.all(6.0),
                  ),
                ),
              ),

              // listview 1
              Container(
                margin: EdgeInsets.only(top: padding, left: padding),
                height: 250.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // text: imax cinema
                    Text("iMax Cinema",
                      style: TextStyle(
                        fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w400,
                      ),
                    ),

                    // listivew 1
                    Flexible(
                      fit: FlexFit.tight,
                      child: ListView.builder(
                          padding: EdgeInsets.only(top: padding),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index){
                            return Container(
                              margin: EdgeInsets.only(right: padding),
                              width: 120.0,
                              child: Column(
                                children: <Widget>[
                                  // image
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: padding /2),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            spreadRadius: 1.0,
                                            blurRadius: 1.0,
                                          )
                                        ],
                                      ),
                                      child: Image.asset(
                                        movie[index].image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),

                                  // text: title
                                  Text(movie[index].text,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  // text: time
                                  Text(movie[index].time,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),

              // listview 2
              Container(
                margin: EdgeInsets.only(top: padding, left: padding),
                height: 250.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // text: cineplex
                    Text("Cineplax",
                      style: TextStyle(
                        fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w400,
                      ),
                    ),

                    // listivew 2
                    Flexible(
                      fit: FlexFit.tight,
                      child: ListView.builder(
                          padding: EdgeInsets.only(top: padding),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index){
                            return InkWell(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AngryBirds2App(index)));
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: padding),
                                width: 120.0,
                                child: Column(
                                  children: <Widget>[
                                    // image
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Hero(
                                        tag: "image ${index+3}",
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: padding /2),
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                spreadRadius: 1.0,
                                                blurRadius: 1.0,
                                              )
                                            ],
                                          ),
                                          child: Image.asset(
                                            movie[index+3].image,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // text: title
                                    Text(movie[index+3].text,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    // text: time
                                    Text(movie[index+3].time,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white54,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),

              // listview 3
              Container(
                margin: EdgeInsets.only(top: padding, left: padding),
                height: 250.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // text: Metro Classic
                    Text("Metro Classic",
                      style: TextStyle(
                        fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w400,
                      ),
                    ),

                    // listivew 3
                    Flexible(
                      fit: FlexFit.tight,
                      child: ListView.builder(
                          padding: EdgeInsets.only(top: padding),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index){
                            return Container(
                              margin: EdgeInsets.only(right: padding),
                              width: 120.0,
                              child: Column(
                                children: <Widget>[
                                  // image
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: padding /2),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            spreadRadius: 1.0,
                                            blurRadius: 1.0,
                                          )
                                        ],
                                      ),
                                      child: Image.asset(
                                        movie[index+6].image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),

                                  // text: title
                                  Text(movie[index+6].text,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  // text: time
                                  Text(movie[index+6].time,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),

              // listview 2
              Container(
                margin: EdgeInsets.only(top: padding, left: padding),
                height: 250.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // text: cineplex
                    Text("Cineplax",
                      style: TextStyle(
                        fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w400,
                      ),
                    ),

                    // listivew 2
                    Flexible(
                      fit: FlexFit.tight,
                      child: ListView.builder(
                          padding: EdgeInsets.only(top: padding),
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index){
                            return Container(
                              margin: EdgeInsets.only(right: padding),
                              width: 120.0,
                              child: Column(
                                children: <Widget>[
                                  // image
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: padding /2),
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            spreadRadius: 1.0,
                                            blurRadius: 1.0,
                                          )
                                        ],
                                      ),
                                      child: Image.asset(
                                        movie[index+3].image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),

                                  // text: title
                                  Text(movie[index+3].text,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  // text: time
                                  Text(movie[index+3].time,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
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
