import 'package:flutter/material.dart';
import 'package:flutter_on_december/1212/character_list.dart';

//

class SecondMoviePage extends StatefulWidget {
  final int index;

  SecondMoviePage(this.index);

  @override
  _SecondMoviePageState createState() => _SecondMoviePageState();
}

class _SecondMoviePageState extends State<SecondMoviePage> {
  // double
  double radius = 24.0;
  double padding = 16.0;

  double positionY = 600.0;
  double positionY1 = 0.0;
  double positionY2 = 0.0;

  @override
  Widget build(BuildContext context) {
    // screen height
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Stack(
          children: <Widget>[
            // background color container
            Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        characterList[widget.index].color,
                        characterList[widget.index].color.withOpacity(0.80),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
            ),

            // appbar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 32.0,
                child: Row(
                  children: <Widget>[
                    // left icon
                    IconButton(
                      onPressed: (){
                        // move back
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios, size: 24.0, color: Colors.black),
                    ),

                    Spacer(),

                    // right icon
                    IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.search, size: 24.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),

            // bottom sheet
            Positioned(
              top: positionY,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    positionY = 600.0;
                  });
                },

                onVerticalDragStart: (DragStartDetails dragStartDetails){},

                onVerticalDragUpdate: (DragUpdateDetails dragUpdateDetails){
                  setState(() {
                    positionY += dragUpdateDetails.delta.dy;
//                    print("positionY = $positionY");

                    // minimum == 600.0
                    if(positionY > 600.0) positionY = 600.0;

                    // half == 470.0

                    // full == 320.0
                    if(positionY < 320.0) positionY = 320.0;
                  });
                },
                onVerticalDragEnd: (DragEndDetails dragEndDetails){
                  setState(() {
                    if (positionY < (470.0 - 320.0) /2 + 320.0) positionY = 320.0;
                    else positionY = 470.0;
                  });
                },
                child: Container(
                  height: screenHeight * 0.50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius),
                    ),
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 4,
                      blurRadius: 4,
                    )],
                  ),
                  child: Placeholder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
