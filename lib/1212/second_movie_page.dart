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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        left: true,
        right: true,
        child: Stack(
          children: <Widget>[
            // background color container
            Positioned.fill(
                child: Hero(
                  tag: "color ${widget.index}",
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

            // image
            Positioned(
              top: 0,
              left: 100.0,
              right: 0,
              child: Hero(
                tag: "image ${widget.index}",
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.50,
                  child: Image.asset(characterList[widget.index].image, fit: BoxFit.contain),
                ),
              ),
            ),

            // column text
            Positioned(
              top: 300.0,
              left: padding,
              right: padding *3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // text : title
                  Text(characterList[widget.index].title,
                    style: TextStyle(
                      fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.bold,
                      height: 2.0
                    ),
                  ),

                  // text : description
                  Text(characterList[widget.index].description,
                    style: TextStyle(
                      fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w400,
                      height: 1.5
                    ),
                  ),
                ],
              ),
            ),

            // bottom sheet
            Positioned(
              
            ),
          ],
        ),
      ),
    );
  }
}
