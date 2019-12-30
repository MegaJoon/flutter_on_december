import 'package:flutter/material.dart';
import 'package:flutter_on_december/1230/card_widget.dart';
import 'package:flutter_on_december/1230/items_list.dart';

// https://dribbble.com/shots/9177633-Solar-system-UI

class SolarSystemUI extends StatefulWidget {
  @override
  _SolarSystemUIState createState() => _SolarSystemUIState();
}

class _SolarSystemUIState extends State<SolarSystemUI> {
  // PageView
  PageController _pageController;
  double currentIndex = 0.0;

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
      backgroundColor: Colors.red.withOpacity(0.90),
      body: Center(
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
    );
  }
}
