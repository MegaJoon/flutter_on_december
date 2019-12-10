import 'package:flutter/material.dart';
import 'package:flutter_on_december/1210/module_list.dart';
import 'package:flutter_on_december/1210/module_tabs.dart';

// https://www.instagram.com/p/B5zNoh9gtYT/?igshid=1e49fvhgqv7jp

class PlayModulesApp extends StatefulWidget {
  @override
  _PlayModulesAppState createState() => _PlayModulesAppState();
}

class _PlayModulesAppState extends State<PlayModulesApp> {
  // tabbarview list
  List<Widget> pages;

  // string
  String title = "PLAY";
  String description = "PLAY features a 360 projection and sound\nsystem that turns any surface into your\nown gaming universe";

  // profile image in appbar
  String _profileImage = "https://cdn.pixabay.com/photo/2019/08/20/13/14/panda-4418773__340.jpg";

  // double
  double padding = 16.0;
  double radius = 16.0;
  double positionY = 0.0;

  // color
  Color _backgroundColor = Color.fromRGBO(18, 29, 35, 1);
  Color _rightColor = Color.fromRGBO(9, 32, 40, 1);
  Color _color = Color.fromRGBO(2, 144, 164, 1);

  // pageview
  int _currentIndex = 0;  // index
  PageController _pageController;

  // tabbar
  int _selectedIndex = 0;

  void _onPressed(int num){
    setState(() {
      _selectedIndex = num;
    });
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _definePages();

    return Scaffold(
      backgroundColor: _backgroundColor,

      // appbar
      appBar: AppBar(
        backgroundColor: _backgroundColor,
        elevation: 0,

        // left icon
        leading: Icon(Icons.menu, size: 24.0, color: Colors.white),

        // center title
        centerTitle: true,
        title: Text(title,
          style: TextStyle(
            fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w600,
          ),
        ),

        // right icon
        actions: <Widget>[
          // profile image
          Container(
            margin: EdgeInsets.only(top: padding /2, bottom: padding /2, right: padding),
            width: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(_profileImage),
                fit: BoxFit.fill,
              ),
            ),
//            child: Placeholder(),
          ),
        ],
      ),

      // box
      body: Column(
        children: <Widget>[
          // top container
          Flexible(
            child: Container(
              padding: EdgeInsets.only(top: padding /2, left: padding, right: padding, bottom: padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // series ex 50
                  RichText(
                    text: TextSpan(
                        children: [
                          // series ex 50 |
                          TextSpan(
                      text: "Series EX 50 ",
                      style: TextStyle(
                        fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.w400,
                      ),
                    ),

                          // | Hydra
                          TextSpan(
                      text: "Hydra",
                      style: TextStyle(
                        fontSize: 12.0, color: _color, fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),),

                  // text : Play modules
                  Text("Play Modules",
                    style: TextStyle(
                      fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Row description
                  Container(
                    height: 48.0,
                    child: Row(
                      children: <Widget>[
                        // index
                        Container(
                          margin: EdgeInsets.only(right: padding /2),
                          width: 2.0,
                          color: _color,
                        ),

                        // description
                        Text(description,
                          style: TextStyle(
                            fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                  ),

                  // text : view details
                  Text("View details",
                    style: TextStyle(
                      fontSize: 14.0, color: _color, fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),

                  // pageview
                  Container(
                    margin: EdgeInsets.only(top: padding /2),
                    height: 100.0,
                    child: Row(
                      children: <Widget>[
                        // pageview
                        Flexible(
                          fit: FlexFit.tight,
                          child: PageView.builder(
                              scrollDirection: Axis.horizontal,
                              controller: _pageController,
                              itemCount: modules.length,
                              itemBuilder: (context, index){
                                return Container(
                                  padding: EdgeInsets.all(2.0),
                                 child: Row(
                                   children: <Widget>[
                                     // left image
                                     Flexible(
                                       flex: 5,
                                       child: Container(
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.only(
                                             topLeft: Radius.circular(radius),
                                             bottomLeft: Radius.circular(radius),
                                           ),
                                           color: Colors.black45,
                                           boxShadow: [BoxShadow(
                                             color: Colors.black12,
                                             spreadRadius: 2,
                                             blurRadius: 2,
                                             offset: Offset(4.0, 4.0),
                                           )],
                                         ),
                                         // asset image
                                         child: Center(
                                             child: Image.asset(
                                                 modules[index].image,
                                                 fit: BoxFit.contain,
                                               height: 80.0,
                                               width: 100.0,
                                             ),
                                         ),
                                       ),
                                     ),

                                     // right text
                                     Flexible(
                                       flex: 7,
                                       child: Container(
                                         padding: EdgeInsets.all(padding),
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.only(
                                             topRight: Radius.circular(radius),
                                             bottomRight: Radius.circular(radius),
                                           ),
                                           color: _rightColor,
                                           boxShadow: [BoxShadow(
                                             color: Colors.black12,
                                             spreadRadius: 2,
                                             blurRadius: 2,
                                             offset: Offset(4.0, 4.0),
                                           )],
                                         ),
                                         // asset image
                                         child: Center(
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: <Widget>[
                                               // title
                                               Text(modules[index].text,
                                                 style: TextStyle(
                                                   fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w600,
                                                 ),
                                               ),

                                               Spacer(),

                                               // title
                                               Row(
                                                 children: <Widget>[
                                                   // profile image
                                                   Container(
                                                     margin: EdgeInsets.only(right: padding /2),
                                                     height: 24.0,
                                                     width: 24.0,
                                                     decoration: BoxDecoration(
                                                       shape: BoxShape.circle,
                                                       image: DecorationImage(
                                                         image: NetworkImage(_profileImage),
                                                         fit: BoxFit.fill,
                                                       ),
                                                     ),
                                                   ),

                                                   // text
                                                   Flexible(
                                                     fit: FlexFit.tight,
                                                     child: Column(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       mainAxisAlignment: MainAxisAlignment.center,
                                                       children: <Widget>[
                                                         Text(modules[index].text,
                                                           style: TextStyle(
                                                             fontSize: 10.0, color: Colors.white, fontWeight: FontWeight.w300,
                                                           ),
                                                         ),

                                                         Text(modules[index].text,
                                                           style: TextStyle(
                                                             fontSize: 8.0, color: Colors.grey, fontWeight: FontWeight.w300,
                                                           ),
                                                         ),
                                                       ],
                                                     ),
                                                   ),

                                                   // icon
                                                   Icon(Icons.arrow_forward_ios, size: 12.0, color: Colors.grey),
                                                 ],
                                               ),

                                               Spacer(),
                                             ],
                                           ),
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                                );
                              }),
                        ),

                        // move page btn
                        Container(
                          margin: EdgeInsets.only(left: padding *3),
                          width: 28.0,
                          child: Column(
                            children: <Widget>[
                              // next btn
                              Flexible(
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _currentIndex == modules.length? null : _currentIndex++;
                                      _pageController.animateToPage(
                                          _currentIndex,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.fastOutSlowIn,
                                      );
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(radius /3),
                                        topRight: Radius.circular(radius /3),
                                      ),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                        child: Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.black,
                                        ),
                                    ),
                                  ),
                                ),
                              ),

                              // previous btn
                              Flexible(
                                child: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _currentIndex == 0? null : _currentIndex--;
                                      _pageController.animateToPage(
                                        _currentIndex,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.fastOutSlowIn,
                                      );
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(radius /3),
                                        bottomRight: Radius.circular(radius /3),
                                      ),
                                      color: _color,
                                    ),
                                    child: Center(
                                      child: Icon(Icons.arrow_back_ios, size: 16.0, color: Colors.white,
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
                ],
              ),
            ),
          ),

          // bottom container
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromRGBO(17, 60, 76, 1), Color.fromRGBO(10, 13, 20, 1)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Row(
                  children: <Widget>[
                    // tabbar
                    Container(
                      width: 80.0,
                      padding: EdgeInsets.symmetric(horizontal: padding / 1.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(radius),
                          bottomRight: Radius.circular(radius),
                        ),
                        color: _rightColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ModuleTabs(icon: Icons.wifi, isSelected: _selectedIndex == 0, onPressed: (){
                            setState(() {
                              _onPressed(0);
                            });
                          },),

                          ModuleTabs(icon: Icons.mic_none, isSelected: _selectedIndex == 1, onPressed: (){
                            setState(() {
                              _onPressed(1);
                            });
                          },),

                          ModuleTabs(icon: Icons.add_circle_outline, isSelected: _selectedIndex == 2, onPressed: (){
                            setState(() {
                              _onPressed(2);
                            });
                          },),

                          ModuleTabs(icon: Icons.av_timer, isSelected: _selectedIndex == 3, onPressed: (){
                            setState(() {
                              _onPressed(3);
                            });
                          },),
                        ],
                      ),
                    ),

                    // tabbarview
                    Flexible(
                      fit: FlexFit.tight,
                      child: pages[_selectedIndex],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _definePages(){
    pages = [
      // initial page
//      Placeholder(color: Colors.red),
      Stack(
        children: <Widget>[
          // main box
          Positioned.fill(
            child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                onPageChanged: (int selectedIndex){
                  setState(() {
                    positionY = selectedIndex * 8.0;
                    print("positionY = $positionY");
                  });
                },
                itemBuilder: (context, index){
                  return Container(
                    padding: EdgeInsets.all(padding),
                    child: Stack(
                      children: <Widget>[
                        // text
                        Positioned(
                          top: padding,
                          left: 0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // index
                              Text("0${(index +1).toString()}",
                                style: TextStyle(
                                  fontSize: 20.0, color: Colors.grey, fontWeight: FontWeight.w400,
                                ),
                              ),

                              SizedBox(width: padding /2),

                              // title
                              Text("All New Ergonomic\nExperience",
                                style: TextStyle(
                                  fontSize: 12.0, color: Colors.grey, fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // image
                        Positioned(
                          top: 50.0,
                          left: -50.0,
                          right: -50.0,
                          bottom: 0,
                          child: Image.asset(
                              "assets/1210/module3.png",
                              fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),

          // indicator
          Positioned(
            top: padding *2,
            right: padding,
            child: Container(
              height: 80.0,
              width: 4.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                color: Colors.black12,
                boxShadow: [BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(2.0, 2.0),
                )],
              ),
              child: Stack(
                children: <Widget>[
                  // indicator
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.fastOutSlowIn,
                    top: positionY,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 48.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        color: _color,
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(2.0, 2.0),
                        )],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // dont use
      Placeholder(color: Colors.amber),
      Placeholder(color: Colors.teal),
      Placeholder(color: Colors.indigo),
    ];
  }
}





















