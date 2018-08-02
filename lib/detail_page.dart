import 'package:flutter/material.dart';
import 'background.dart';
import 'data.dart';

class Details extends StatefulWidget {
  int index;

  Details(this.index);

  @override
  PlaceDetails createState() => new PlaceDetails();
}

class PlaceDetails extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    List list = new Data().getList();
    dataObject data = list[widget.index];
    return new Container(
      child: new Stack(
        children: <Widget>[
          new Hero(
              tag: '110135',
              child: new CustomPaint(
                size: new Size(_width, _height),
                painter: new Background(),
              )),
          new Hero(
              tag: '110136',
              child: new Align(
                alignment: Alignment.bottomRight,
                child: new Image.asset(
                  'assets/tree.png',
                  scale: 4.0,
                  color: Colors.white,
                ),
              )),
          new ClipPath(
            clipper: new ArcClipper(),
            child: new Container(
              child: new Image.network(
                data.url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          new Scaffold(
              appBar: new AppBar(
                title: new Text(''),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              ),
              backgroundColor: Colors.transparent,
              body: new Padding(
                padding: new EdgeInsets.only(top: _height / 10),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Hero(
                      tag: '110135${widget.index}',
                      child: new Container(
                        width: _width / 2,
                        height: _height / 4,
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          image: DecorationImage(
                            image: NetworkImage(
                              data.url,
                            ),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.black.withAlpha(70),
                                offset: const Offset(3.0, 6.0),
                                blurRadius: 5.0)
                          ],
                        ),
                        margin: new EdgeInsets.only(left: 20.0),
                        child: new Stack(
                          children: <Widget>[
                            new Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                  padding: new EdgeInsets.only(
                                      left: 20.0, bottom: 20.0),
                                  child: new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      new Text(
                                        data.placeName,
                                        style: new TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      new Text(
                                        'Subtitle ${data.placeName}',
                                        style: new TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(
                          top: _height / 30,
                          left: _width / 20,
                          right: _width / 20),
                      child: new Container(
                        decoration: new BoxDecoration(
                          color: Colors.white30,
                          borderRadius: new BorderRadius.only(
                              topRight: new Radius.circular(20.0),
                              bottomRight: new Radius.circular(20.0),
                              bottomLeft: new Radius.circular(20.0)),
                        ),
                        child: new Padding(
                          padding: new EdgeInsets.all(16.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                data.placeName,
                                style: new TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              new Divider(
                                color: Colors.white,
                              ),
                              new Text(
                                data.desc,
                                style: new TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  // this class is copied from below url
  //https://flutter.rocks/2017/09/12/from-wireframes-to-flutter-movie-details-page/
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
