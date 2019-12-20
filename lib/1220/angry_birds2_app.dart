import 'package:flutter/material.dart';
import 'package:flutter_on_december/1220/movie_list.dart';
import 'package:video_player/video_player.dart';

class AngryBirds2App extends StatefulWidget {
  final int index;

  AngryBirds2App(this.index);

  @override
  _AngryBirds2AppState createState() => _AngryBirds2AppState();
}

class _AngryBirds2AppState extends State<AngryBirds2App> {
  // color
  Color _backgroundColor = Color.fromRGBO(240, 142, 12, 1);

  // string text
  String title = "Movies";
  String bottomText = "Details";
  String bottomText1 = "Show Times";
  String bottomText2 = "Theater";
  String description = "Angry Birds celebrates its 10th anniversary on December 11, 2019! It’s been a long journey and the birds are still flying high. Check out the timeline to see all of the biggest beats from the past decade.";

  // double
  double padding = 16.0;

  // videoplayer
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // set background color
      backgroundColor: _backgroundColor,

      body: Stack(
        children: <Widget>[
          // column
          Positioned.fill(
              child: Column(
                children: <Widget>[
                  // main
                  Flexible(
                    fit: FlexFit.tight,
                      child: Column(
                        children: <Widget>[
                          // top container: movie
                          Flexible(
                            child: Stack(
                              children: <Widget>[
                                // movie
                                Positioned.fill(
                                  child: FutureBuilder(
                                    future: _initializeVideoPlayerFuture,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.done) {
                                        return AspectRatio(
                                          aspectRatio: _controller.value.aspectRatio,
                                          child: VideoPlayer(_controller),
                                        );
                                      } else {
                                        return Center(child: CircularProgressIndicator());
                                      }
                                    },
                                  )
                                ),

                                // play btn
                                Positioned(
                                  top: padding,
                                  right: padding,
                                  child: Center(
                                    child: FloatingActionButton(
                                      backgroundColor: Colors.white,
                                      onPressed: (){
                                        if (!mounted) return;
                                        setState(() {
                                          // If the video is playing, pause it.
                                          if (_controller.value.isPlaying) {
                                            _controller.pause();
                                          } else {
                                            // If the video is paused, play it.
                                            _controller.play();
                                          }
                                        });                                        setState(() {});
                                        },
                                      child: Icon(
                                        Icons.arrow_right,
                                        size: 40.0,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // bottom container: movie title
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.all(padding),
                              child: Column(
                                children: <Widget>[
                                  // top
                                  Flexible(
                                    flex: 3,
                                    child: Row(
                                      children: <Widget>[
                                        // image
                                        Hero(
                                          tag: "image ${widget.index+3}",
                                          child: Container(
                                            width: 120.0,
                                            child: Image.asset(
                                                movie[widget.index +3].image,
                                            fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),

                                        SizedBox(width: padding),

                                        // text
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            // text: iMax Cinema
                                            Text("iMax Cinema",
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.white70,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),

                                            // text: title
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: movie[widget.index +3].text + "\n",
                                                    style: TextStyle(
                                                      fontSize: 24.0,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),

                                                  TextSpan(
                                                    text: "Movie",
                                                    style: TextStyle(
                                                      fontSize: 24.0,
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ]
                                              ),
                                            ),


                                            // text: time
                                            Text(movie[widget.index +3].time,
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                color: Colors.white70,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),

                                            // text: genre
                                            Container(
                                              height: 20.0,
                                              child: Row(
                                                children: <Widget>[
                                                  // genre 1
                                                  Container(
                                                    margin: EdgeInsets.only(right: padding),
                                                    width: 64.0,
                                                    decoration: ShapeDecoration(
                                                      shape: StadiumBorder(),
                                                      color: Colors.white.withOpacity(0.40),
                                                    ),
                                                    child: Center(
                                                      child: Text("PG-13",
                                                        style: TextStyle(
                                                          fontSize: 12.0,
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                  // genre 2
                                                  Container(
                                                    margin: EdgeInsets.only(right: padding),
                                                    width: 64.0,
                                                    decoration: ShapeDecoration(
                                                      shape: StadiumBorder(),
                                                      color: Colors.white.withOpacity(0.40),
                                                    ),
                                                    child: Center(
                                                      child: Text("Fantasy",
                                                        style: TextStyle(
                                                          fontSize: 12.0,
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                  // genre 3
                                                  Container(
                                                    margin: EdgeInsets.only(right: padding),
                                                    width: 64.0,
                                                    decoration: ShapeDecoration(
                                                      shape: StadiumBorder(),
                                                      color: Colors.white.withOpacity(0.40),
                                                    ),
                                                    child: Center(
                                                      child: Text("Sci-Fi",
                                                        style: TextStyle(
                                                          fontSize: 12.0,
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  // divider
                                  Divider(
                                    color: Colors.white,
                                  ),

                                  // bottom
                                  Flexible(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        // text: story line
                                        Text("Storyline",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            height: 1.5,
                                          ),
                                        ),

                                        // text: description
                                        Text(description,
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            height: 1.5,
                                          ),

                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                  ),

                  // bottom bar
                  Container(
                    height: 40.0,
                    color: Colors.black,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // text: bottomText
                        Text(bottomText.toUpperCase(),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        // text: bottomText1
                        Text(bottomText1.toUpperCase(),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        // text: bottomText2
                        Text(bottomText2.toUpperCase(),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ),

          // appbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Container(
                height: 40.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // left icon
                    IconButton(
                      onPressed: (){
                        // move back page
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 24.0,
                        color: Colors.white,
                      ),
                    ),

                    // text: title
                    Text(title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // spacer
                    Container(
                      height: 40.0,
                      width: 48.0,
//                    child: Placeholder(),
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
}
