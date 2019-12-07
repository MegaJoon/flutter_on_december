import 'package:flutter/material.dart';
import 'package:flutter_on_december/1206/sector_list.dart';

// https://dribbble.com/shots/6448509-Galacticbnb-App

class CloneGalacticBnb extends StatefulWidget {
  @override
  _CloneGalacticBnbState createState() => _CloneGalacticBnbState();
}

class _CloneGalacticBnbState extends State<CloneGalacticBnb> {
  double padding = 16.0;

  String title = "Andat sector";

  ValueNotifier<double> notifier;

  PageController _pageController;

  int _currentIndex = 1;  // pageview index

  ScrollController _scrollController;

  void _onScroll(){
    notifier.value = _pageController.page;
    // moving Function
    onChanged(notifier.value * MediaQuery.of(context).size.width);
  }

  void onChanged(double position){
    setState(() {
      _scrollController.animateTo(
          position,
          duration: Duration(milliseconds: 50),
          curve: Curves.fastOutSlowIn,
      );
    });
  }

  @override
  void initState() {
    notifier = ValueNotifier<double>(0);  // init

    // pageview controller
    _pageController = PageController(initialPage: _currentIndex, viewportFraction: 0.70)
    ..addListener(_onScroll);

    // _scrollController
    _scrollController = ScrollController(initialScrollOffset: _currentIndex * 410.0);
    super.initState();
  }

  @override
  void dispose() {
    notifier?.dispose();
    _pageController?.dispose();
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background listview
          Positioned.fill(
              child: ListView.builder(
                itemCount: sector.length,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,  // scrollcontroller
                  itemBuilder: (context, index){
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(sector[index].backgroundImage, fit: BoxFit.fill),
                    );
                  }),
          ),

          // main box
          Positioned.fill(
              child: SafeArea(
                top: true,
                left: true,
                right: true,
                child: Column(
                  children: <Widget>[
                    // appbar
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: padding),
                      height: 64.0,
//                      color: Colors.teal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // left icon
                          Icon(Icons.arrow_back_ios, size: 24.0, color: Colors.white),

                          // title
                          Text(title.toUpperCase(),
                            style: TextStyle(
                              fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w400,
                            ),
                          ),

                          // right icon
                          Icon(Icons.favorite_border, size: 24.0, color: Colors.white),
                        ],
                      ),
                    ),

                    // pageview
                    Flexible(
                      fit: FlexFit.tight,
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                          itemCount: sector.length,
                          controller: _pageController,
                          itemBuilder: (context, index){
                          return Container(
                            margin: EdgeInsets.all(padding),
//                            color: Colors.white,
                            child: Stack(
                              children: <Widget>[
                                // border
                                Positioned.fill(
                                    child: CustomPaint(
                                      painter: BorderPaint(boxHeight: 30.0, boxWidth: 100.0),
                                    ),
                                ),

                                // in container
                                Positioned.fill(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        // top
                                        Flexible(
                                          child: Container(
                                            margin: EdgeInsets.all(1.0),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  sector[index].image),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
//                                            child: Placeholder(),
                                          ),
                                        ),

                                        // divider
                                        Container(
                                          height: 2.0,
                                          color: Colors.white,
                                        ),

                                        // bottom
                                        Flexible(
                                          child: ClipPath(
                                            clipper: MyClipper(boxHeight: 30.0, boxWidth: 100.0),
                                            child: Container(
                                              padding: EdgeInsets.all(padding),
                                              margin: EdgeInsets.all(1.0),
                                              width: MediaQuery.of(context).size.width,
                                              color: Colors.black12.withOpacity(0.30),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  // title
                                                  Text(sector[index].title,
                                                    style: TextStyle(
                                                      fontSize: 28.0, color: Colors.white, fontWeight: FontWeight.w600,
                                                    ),
                                                  ),

                                                  SizedBox(height: padding /2),

                                                  // score
                                                  Row(
                                                    children: <Widget>[
                                                      Icon(Icons.favorite, size: 16.0, color: Colors.grey),
                                                      Icon(Icons.favorite, size: 16.0, color: Colors.grey),
                                                      Icon(Icons.favorite, size: 16.0, color: Colors.grey),
                                                      Icon(Icons.favorite, size: 16.0, color: Colors.grey),
                                                      Icon(Icons.favorite_border, size: 16.0, color: Colors.grey),
                                                    ],
                                                  ),

                                                  SizedBox(height: padding),

                                                  // subtitle
                                                  Text(sector[index].subTitle,
                                                    style: TextStyle(
                                                      fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ),
                              ],
                            ),
                          );
                          },
                      ),
                    ),

                    // bottom indicator
                    Container(
                      height: 64.0,
                      color: Colors.teal,
                      child: Placeholder(),
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}

// bprder paint class
class BorderPaint extends CustomPainter {
  double boxHeight;
  double boxWidth;

  BorderPaint({this.boxHeight, this.boxWidth});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
        ..color = Colors.white
        ..strokeWidth = 2.0
        ..strokeCap = StrokeCap.round;

    Offset p1 = Offset(0.0, 0.0);
    Offset p2 = Offset(0.0, size.height);
    Offset p3 = Offset(size.width - boxWidth, size.height);
    Offset p4 = Offset(size.width - (boxWidth - 20.0), size.height - boxHeight);
    Offset p5 = Offset(size.width, size.height - boxHeight);
    Offset p6 = Offset(size.width, 0.0);



    canvas.drawLine(p1, p2, paint);
    canvas.drawLine(p2, p3, paint);
    canvas.drawLine(p3, p4, paint);
    canvas.drawLine(p4, p5, paint);
    canvas.drawLine(p5, p6, paint);
    canvas.drawLine(p6, p1, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// opacitiy bottom container clipper class
class MyClipper extends CustomClipper<Path> {
  double boxHeight;
  double boxWidth;

  MyClipper({this.boxHeight, this.boxWidth});

  @override
  Path getClip(Size size) {
    var path = Path()
    ..lineTo(0.0, 0.0)
    ..lineTo(0.0, size.height)
    ..lineTo(size.width - boxWidth, size.height)
    ..lineTo(size.width - (boxWidth - 20.0), size.height - boxHeight)
    ..lineTo(size.width, size.height - boxHeight)
    ..lineTo(size.width, 0.0)
    ..lineTo(0.0, 0.0)
    ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
























