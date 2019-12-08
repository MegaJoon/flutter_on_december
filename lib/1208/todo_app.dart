import 'package:flutter/material.dart';

// https://www.instagram.com/p/B5v2fHQgnHu/?igshid=botyyqm1207q

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Column(
            children: <Widget>[
              // appbar
              Container(
                height: 40.0,
                child: Row(
                  children: <Widget>[
                    // left icon
                    Icon(Icons.menu, size: 24.0, color: Colors.black),

                    
                  ],
                ),
              ),


            ],
          ),
      ),
    );
  }
}
