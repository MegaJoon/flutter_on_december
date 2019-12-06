import 'package:flutter/material.dart';
import 'package:flutter_on_december/1206/second_bnb_app.dart';
import 'package:flutter_on_december/1206/sector_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// https://dribbble.com/shots/6448509-Galacticbnb-App

class GalacticBnb extends StatefulWidget {
  @override
  _GalacticBnbState createState() => _GalacticBnbState();
}

class _GalacticBnbState extends State<GalacticBnb> {
  double padding = 16.0;

  String title = "Anoat sector";

  ValueNotifier<double> notifier;

  PageController pageController;

  int _currentIndex = 1;

  void _onScroll() {
    notifier.value = pageController.page;
    onChanged(notifier.value * MediaQuery.of(context).size.width);
  }

  ScrollController scrollController;

  void onChanged(double position) {
    setState(() {
      scrollController.animateTo(position, duration: Duration(milliseconds: 100), curve: Curves.fastOutSlowIn);
    });
  }

  @override
  void initState() {
    notifier = ValueNotifier<double>(0);

    pageController = PageController(initialPage: _currentIndex, viewportFraction: 0.70)
    ..addListener(_onScroll);

    scrollController = ScrollController(initialScrollOffset: _currentIndex * 410.0);
    super.initState();
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background image
          Positioned.fill(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: sector.length,
              controller: scrollController,
              itemBuilder: (context, index) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                      sector[index].backgroundImage,
                      fit: BoxFit.fill,
                  ),
                );
              },
            ),
          ),

          // box
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
                    margin: EdgeInsets.only(bottom: padding),
                    height: 64.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // left icon
                        IconButton(
                          onPressed: (){},
                          icon: Icon(FontAwesomeIcons.chevronLeft, size: 24.0, color: Colors.white),
                        ),

                        // title
                        Text(title,
                          style: TextStyle(
                            fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w400,
                          ),
                        ),

                        // right icon
                        IconButton(
                          onPressed: (){},
                          icon: Icon(FontAwesomeIcons.adjust, size: 24.0, color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  // mainbox
                  Flexible(
                    fit: FlexFit.tight,
                    child: PageView.builder(
                      itemCount: sector.length,
                      scrollDirection: Axis.horizontal,
                      controller: pageController,
                      onPageChanged: (int currentIndex) {
                        _currentIndex = currentIndex;
                      },
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SecondBnbApp(index)));
                          },
                          child: Container(
                            margin: EdgeInsets.all(padding),
                            child: Stack(
                              children: <Widget>[
                                // border paint
                                Positioned.fill(
                                  child: CustomPaint(
                                    painter: MyPaint(),
                                  ),
                                ),

                                // box
                                Positioned.fill(
                                  child: Column(
                                    children: <Widget>[
                                      // top
                                      Flexible(
                                        fit: FlexFit.tight,
                                        child: Container(
                                          margin: EdgeInsets.only(top: 1.0, left: 1.0, right: 1.0),
                                          child: Image.asset(sector[index].image, fit: BoxFit.fill),
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
                                          clipper: MyClipper(),
                                          child: Container(
                                            margin: EdgeInsets.only(left: 1.0, right: 1.0, bottom: 1.0),
                                            padding: EdgeInsets.all(padding),
                                            color: Colors.black.withOpacity(0.3),
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  // title
                                                  Text(
                                                    sector[index].title,
                                                    style: TextStyle(
                                                      fontSize: 24.0,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),

                                                  SizedBox(height: padding / 2),

                                                  // score
                                                  Container(
                                                    height: 18.0,
                                                    width: 80.0,
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: <Widget>[
                                                        Icon(Icons.favorite, size: 12.0, color: Colors.white),
                                                        Icon(Icons.favorite, size: 12.0, color: Colors.white),
                                                        Icon(Icons.favorite, size: 12.0, color: Colors.white),
                                                        Icon(Icons.favorite, size: 12.0, color: Colors.white),
                                                        Icon(Icons.favorite_border, size: 12.0, color: Colors.white70),
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(height: padding),

                                                  // subtitle
                                                  Text(
                                                    sector[index].subTitle,
                                                    style: TextStyle(
                                                      fontSize: 10.0,
                                                      color: Colors.white70,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // indicator
                  Container(
                      padding: EdgeInsets.symmetric(vertical: padding),
                      height: 68.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: padding / 2),
                            height: 64.0,
                            width: 12.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red, width: 1.0),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: padding / 2),
                            height: 64.0,
                            width: 12.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.orange, width: 1.0),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: padding / 2),
                            height: 64.0,
                            width: 12.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.amber, width: 1.0),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: padding / 2),
                            height: 64.0,
                            width: 12.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.orange, width: 1.0),
                            ),
                          ),
                          Container(
                            height: 64.0,
                            width: 12.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red, width: 1.0),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    Offset p1 = Offset(0.0, 0.0);
    Offset p2 = Offset(0.0, size.height);
    Offset p3 = Offset(size.width - 100.0, size.height);
    Offset p4 = Offset(size.width - 80.0, size.height - 20.0);
    Offset p5 = Offset(size.width, size.height - 20.0);
    Offset p6 = Offset(size.width, 0.0);
    Offset p7 = Offset(0.0, 0.0);

    canvas.drawLine(p1, p2, paint);
    canvas.drawLine(p2, p3, paint);
    canvas.drawLine(p3, p4, paint);
    canvas.drawLine(p4, p5, paint);
    canvas.drawLine(p5, p6, paint);
    canvas.drawLine(p6, p7, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(0.0, 0.0)
      ..lineTo(0.0, size.height)
      ..lineTo(size.width - 100.0, size.height)
      ..lineTo(size.width - 80.0, size.height - 20.0)
      ..lineTo(size.width, size.height - 20.0)
      ..lineTo(size.width, 0.0)
      ..lineTo(0.0, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
