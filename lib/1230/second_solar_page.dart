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
  // double
  double imageWidth = 250.0;
  double padding = 16.0;
  double radius = 16.0;

  // color
  Color _textColor = Color.fromRGBO(192, 182, 99, 1);

  // image
  List<String> imageList = [
    "https://cdn.pixabay.com/photo/2019/12/08/16/00/nature-4681448__340.jpg",
    "https://cdn.pixabay.com/photo/2019/12/14/12/08/night-4694750__340.jpg",
    "https://cdn.pixabay.com/photo/2019/12/05/11/10/snowman-4674856__340.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // set background color
      backgroundColor: Colors.black,

      // body
      body: Stack(
        children: <Widget>[
          // column
          Positioned(
            top: 80.0,
              left: padding,
              right: padding,
              bottom: 0,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // top texts
                    Container(
                      margin: EdgeInsets.only(bottom: padding *3),
                      height: 200.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // text: distance from sun
                          Text("Distance from sun",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          // text: 148.377.282~
                          Text("148,377,282 MI KM",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Spacer(),

                          // text: radius
                          Text("Radius",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          // text: 3,390 kilometers
                          Text("3,390 kilometers",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Spacer(),

                          // text: Year
                          Text("Year",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          // text: 678 Earth Days
                          Text("678 Earth Days",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Spacer(),

                          // text: Planet type
                          Text("Planet type",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w400,
                            ),
                          ),

                          // text: Terrestrial
                          Text("Terrestrial",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // text: title, subtitle
                    Container(
                      margin: EdgeInsets.only(bottom: padding *2),
                      height: 120.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // text: text
                          Row(
                            children: <Widget>[
                              // text: text
                              Text(items[widget.index].text,
                                style: TextStyle(
                                  fontSize: 48.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // spacer
                              Spacer(),

                              // 2 icons
                              Icon(
                                Icons.favorite_border,
                                size: 24.0,
                                color: Colors.grey,
                              ),

                              SizedBox(width: 8.0),

                              Icon(
                                Icons.file_download,
                                size: 24.0,
                                color: Colors.grey,
                              ),
                            ],
                          ),

                          // text: description
                          RichText(
                            maxLines: 5,
                            text: TextSpan(children: [
                              TextSpan(text: items[widget.index].description,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w400,
                                ),
                              ),

                              TextSpan(text: "Read more",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: _textColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // container: gallery
                    Container(
                      margin: EdgeInsets.only(bottom: padding *2),
                      height: 150.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // text: Gallery
                          Text("Gallery",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          // listview
                          Flexible(
                            fit: FlexFit.tight,
                            child: ListView.builder(
                                padding: EdgeInsets.only(top: 4.0),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (context, index){
                                  return Container(
                                    margin: EdgeInsets.only(right: padding),
                                    width: 130.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(radius),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            imageList[index],
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
//                                    child: Placeholder(),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),

                    // container: Size and Distance
                    Container(
                      margin: EdgeInsets.only(bottom: padding *2),
                      height: 150.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // text: Size and Distance
                          Text("Size and Distance",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          // listview
                          Flexible(
                            fit: FlexFit.tight,
                            child: ListView.builder(
                                padding: EdgeInsets.only(top: 4.0),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: (context, index){
                                  return Container(
                                    margin: EdgeInsets.only(right: padding),
                                    width: 130.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(radius),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          imageList[index],
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
//                                    child: Placeholder(),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ),

          // appbar
          Positioned(
            top: 0,
            left: padding,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  height: 28.0,
                  width: 28.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.close,
                      size: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
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
