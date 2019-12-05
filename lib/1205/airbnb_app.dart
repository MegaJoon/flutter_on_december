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

  int _currentIndex = 0;

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
      Placeholder(color: Colors.red),
      Placeholder(color: Colors.amber),
      Placeholder(color: Colors.teal),
      Placeholder(color: Colors.deepPurple),
      Placeholder(color: Colors.pinkAccent),
    ];
  }
}











