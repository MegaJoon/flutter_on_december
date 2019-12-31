import 'package:flutter/material.dart';
import 'package:flutter_on_december/1230/card_widget.dart';
import 'package:flutter_on_december/1230/items_list.dart';

// https://dribbble.com/shots/9177633-Solar-system-UI

class SolarSystemUI extends StatefulWidget {
  @override
  _SolarSystemUIState createState() => _SolarSystemUIState();
}

class _SolarSystemUIState extends State<SolarSystemUI> {
  // image
  String _backgroundImage = "assets/1230/image.jpg";

  // PageView
  PageController _pageController;
  double currentIndex = items.length - 1.0;

  @override
  void initState() {
    _pageController = PageController(initialPage: currentIndex.toInt())
    ..addListener((){
      setState(() {
        currentIndex = _pageController.page;
        print("currentIndex = $currentIndex");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background image
          Positioned.fill(
            child: Image.asset(
                _backgroundImage,
                fit: BoxFit.fill,
            ),
          ),

          // Center PageView
          Center(
            child: Container(
              height: 400.0,
              child: Stack(
                children: <Widget>[
                  // main
                  CardWidget(currentIndex),

                  // PageView
                  Positioned.fill(
                      child: PageView.builder(
                        itemCount: items.length,
                        scrollDirection: Axis.horizontal,
                          controller: _pageController,
                          itemBuilder: (context, index){
                            return Container();
                          }),
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
