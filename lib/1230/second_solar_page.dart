import 'package:flutter/material.dart';
import 'package:flutter_on_december/1230/items_list.dart';

// second solar page

class SecondSolarPage extends StatefulWidget {
  final int index;

  SecondSolarPage(this.index);

  @override
  _SecondSolarPageState createState() => _SecondSolarPageState();
}

class _SecondSolarPageState extends State<SecondSolarPage> {
  // color
  Color _backgroundColor = Colors.grey[900];

  // double
  double imageWidth = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // set background color
      backgroundColor: Colors.black,

      // body
      body: Stack(
        children: <Widget>[
          // column
          Positioned.fill(
              child: Placeholder(),
          ),

          // topRight image
          Positioned(
            top: 32.0,
            right: -imageWidth /2,
            child: Transform.rotate(
              angle: -0.35,
              child: Container(
                height: imageWidth,
                width: imageWidth,
                child: Image.network(
                  items[widget.index].animatedImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
