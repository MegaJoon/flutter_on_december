import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// https://dribbble.com/shots/6377667-Airbnb-concept/attachments

class AirbnbApp extends StatefulWidget {
  @override
  _AirbnbAppState createState() => _AirbnbAppState();
}

class _AirbnbAppState extends State<AirbnbApp> {
  List<Widget> pages;

  Color _color = Color.fromRGBO(251, 129, 144, 1);
  Color _plusColor = Color.fromRGBO(143, 72, 108, 1);

  int _currentIndex = 0;

  double padding = 16.0;

  @override
  Widget build(BuildContext context) {
    _definePages();

    return Scaffold(
      body: pages[_currentIndex],

      // bottom bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,

        unselectedItemColor: Colors.black,
        unselectedIconTheme: IconThemeData(color: Colors.black, size: 28.0),
        unselectedLabelStyle: TextStyle(color: Colors.black, fontSize: 10.0, fontWeight: FontWeight.w600),
        unselectedFontSize: 10.0,

        selectedItemColor: _color,
        selectedIconTheme: IconThemeData(color: _color, size: 28.0),
        selectedLabelStyle: TextStyle(color: _color, fontSize: 10.0, fontWeight: FontWeight.w600),
        selectedFontSize: 10.0,

        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,

        showSelectedLabels: true,
        showUnselectedLabels: true,

        // bottom items
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("EXPLORE")),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), title: Text("SAVED")),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.airbnb), title: Text("TRIIPS")),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), title: Text("INBOX")),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text("PROFILE")),
        ],
      ),
    );
  }

  _definePages(){
    pages = [
      // initial page
//      Placeholder(color: Colors.red),
    SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // textfield
            Container(
              margin: EdgeInsets.only(top: padding /2, right: padding),
              height: 40.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)],
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Los Angeles, CA",
                  hintStyle: TextStyle(
                    fontSize: 16.0, color: Colors.black45, fontWeight: FontWeight.w600,
                  ),
                  contentPadding: EdgeInsets.all(12.0)
                ),
              ),
            ),

            // tab
            Container(
              height: 48.0,
              child: ListView(
                padding: EdgeInsets.only(top: padding),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  // dates
                  Container(
                    margin: EdgeInsets.only(right: padding),
                    width: 80.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 1.0),
                    ),
                    child: Center(
                        child: Text("Dates",
                          style: TextStyle(
                              fontSize: 16.0, color: Colors.black54, fontWeight: FontWeight.w600),
                        ),
                    ),
                  ),

                  // 2 gusets, 1 child
                  Container(
                    width: 150.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 1.0),
                      color: Colors.teal,
                    ),
                    child: Center(
                      child: Text("2 guests, 1 child",
                        style: TextStyle(
                            fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // explore los angeles
            Container(
              margin: EdgeInsets.only(top: padding *2),
              height: 150.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // title
                  Text("Explore Los Angeles".toUpperCase(),
                    style: TextStyle(
                      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold,
                    ),
                  ),

                  // listview
                  Flexible(
                    fit: FlexFit.tight,
                    child: ListView.builder(
                        padding: EdgeInsets.only(top: padding, bottom: 1.0),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: exploreList.length,
                        itemBuilder: (context, index){
                          return Container(
                            margin: EdgeInsets.only(right: padding),
                            width: 150.0,
                            child: Column(
                              children: <Widget>[
                                // image
                                Flexible(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                      boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)],
                                      image: DecorationImage(
                                        image: NetworkImage(exploreList[index].image),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),

                                // text
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    padding: EdgeInsets.all(padding /2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(4.0),
                                        bottomRight: Radius.circular(4.0),
                                      ),
                                      color: Colors.white,
                                      boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)],
                                    ),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                        child: Text(exploreList[index].text,
                                        style: TextStyle(
                                          fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w600,
                                        ),
                                        ),
                                    ),
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

            Flexible(
              fit: FlexFit.tight,
              child: Container(
                margin: EdgeInsets.only(top: padding *2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // text
                    Text("Introducing Airbnb Plus in\nLos Angeles",
                      style: TextStyle(
                        fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold, height: 1.5,
                      ),
                    ),
                    Text("A selection of homes verified for quality\nand designs",
                      style: TextStyle(
                        fontSize: 14.0, color: Colors.black54, fontWeight: FontWeight.bold, height: 1.5,
                      ),
                    ),

                    // second listview
                    Flexible(
                      fit: FlexFit.tight,
                      child: ListView.builder(
                        padding: EdgeInsets.only(top: padding),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: roomList.length,
                          itemBuilder: (context, index){
                          return Container(
                            margin: EdgeInsets.only(right: padding),
                            width: 180.0,
                            child: Column(
                              children: <Widget>[
                                // image
                                Flexible(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(roomList[index].image),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),

                                // text
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: padding / 3),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        // plus : verified -
                                        Container(
                                          height: 20.0,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: <Widget>[
                                              // plus in container
                                              Container(
                                                width: 40.0,
                                                color: _plusColor,
                                                child: Center(
                                                  child: Text("Plus".toUpperCase(),
                                                    style: TextStyle(
                                                      fontSize: 10.0, color: Colors.white, fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              SizedBox(width: 8.0),

                                              // text
                                              Text("Verified - Entire Loft".toUpperCase(),
                                                style: TextStyle(
                                                  fontSize: 10.0, color: _plusColor, fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        // text
                                        Text(roomList[index].text,
                                        style: TextStyle(
                                          fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w600,
                                        ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),

                                        // price
                                        Text(roomList[index].price,
                                        style: TextStyle(
                                          fontSize: 12.0, color: Colors.black, fontWeight: FontWeight.w600,
                                        ),
                                        ),
                                      ],
                                    ),
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
            ),
          ],
        ),
      ),
    ),

      // dont use
      Placeholder(color: Colors.amber),
      Placeholder(color: Colors.teal),
      Placeholder(color: Colors.deepPurple),
      Placeholder(color: Colors.pinkAccent),
    ];
  }
}

// first listview
class ExploreList {
  String image;
  String text;

  ExploreList({this.image, this.text});
}

List<ExploreList> exploreList = [
  ExploreList(image: "https://cdn.pixabay.com/photo/2016/06/24/10/47/architecture-1477041__340.jpg", text: "Homes"),
  ExploreList(image: "https://cdn.pixabay.com/photo/2016/10/06/05/19/engagement-1718244__340.jpg", text: "Experiences"),
  ExploreList(image: "https://cdn.pixabay.com/photo/2014/09/17/20/26/restaurant-449952__340.jpg", text: "Restaurant"),
  ExploreList(image: "https://cdn.pixabay.com/photo/2017/08/06/00/27/yoga-2587066__340.jpg", text: "Yoga"),
];

// second listview
class RoomList {
  String image;
  String text;
  String price;

  RoomList({this.image, this.text, this.price});
}

List<RoomList> roomList = [
  RoomList(image: "https://cdn.pixabay.com/photo/2014/08/11/21/39/wall-416060__340.jpg", text: "Live the LA Lifestyle in\nloft near Metro", price: "\@9,363 per night"),
  RoomList(image: "https://cdn.pixabay.com/photo/2017/08/27/10/16/interior-2685521__340.jpg", text: "Quiet Suite in Classic\nVenice Home with LuvLUlullulululu", price: "\@9,363 per night"),
  RoomList(image: "https://cdn.pixabay.com/photo/2016/08/26/15/06/home-1622401__340.jpg", text: "Live the LA Lifestyle in\nloft near Metro", price: "\@9,363 per night"),
];









