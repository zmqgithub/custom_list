import 'package:flutter/material.dart';
import 'background.dart';
import 'detail_page.dart';
import 'data.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
          primarySwatch: Colors.blue, platform: TargetPlatform.iOS),
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List list = new Data().getList();

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

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
                  color: const Color(0xFF222D57).withOpacity(0.4),
                ),
              )),
          new Scaffold(
              appBar: new AppBar(
                backgroundColor: Colors.transparent,
                title: new Text(widget.title),
                centerTitle: false,
                elevation: 0.0,
              ),
              backgroundColor: Colors.transparent,
              body: new Stack(
                children: <Widget>[
                  new Padding(
                    padding: new EdgeInsets.only(left: 20.0, top: 50.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          'Travel the worls',
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.white),
                        ),
                        new Text(
                          'See the world\'s best places',
                          style: new TextStyle(
                              fontSize: 10.0, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  new Container(
                    child: new Column(
                      children: <Widget>[
                        new Padding(
                          padding: new EdgeInsets.only(top: _height / 7),
                          child: new Container(
                            height: 250.0,
                            child: new ListView.builder(
                              itemBuilder: (context, index) {
                                dataObject data = list[index];
                                return new InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        new PageRouteBuilder(
                                            pageBuilder: (BuildContext context,
                                                    Animation<double> animation,
                                                    Animation<double>
                                                        secondaryAnimation) =>
                                                new Details(index),
                                            transitionsBuilder: (
                                              BuildContext context,
                                              Animation<double> animation,
                                              Animation<double>
                                                  secondaryAnimation,
                                              Widget child,
                                            ) {
                                              return new SlideTransition(
                                                position: new Tween<Offset>(
                                                  begin: const Offset(1.0, 0.0),
                                                  end: Offset.zero,
                                                ).animate(animation),
                                                child: new SlideTransition(
                                                  position: new Tween<Offset>(
                                                    begin: Offset.zero,
                                                    end: const Offset(0.0, 1.0),
                                                  ).animate(secondaryAnimation),
                                                  child: child,
                                                ),
                                              );
                                            },
                                            transitionDuration: const Duration(
                                                milliseconds: 500)));
                                  },
                                  child: new Hero(
                                      tag: '110135$index',
                                      child: new Container(
//                                  height: 180.0,
                                        width: _width / 1.8,
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
                                                color:
                                                    Colors.black.withAlpha(70),
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
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      new Text(
                                                        data.placeName,
                                                        style: new TextStyle(
                                                            fontSize: 20.0,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      new Text(
                                                        'Subtitle ${data.placeName}',
                                                        style: new TextStyle(
                                                            fontSize: 10.0,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ),
                                                    ],
                                                  )),
                                            )
                                          ],
                                        ),
                                      )),
                                );
                              },
                              scrollDirection: Axis.horizontal,
                              itemCount: list.length,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      //your elements here

                      new Padding(
                        padding: new EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              'Upcomming events',
                              style: new TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            new Text(
                              'See recent events',
                              style: new TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.normal),
                            ),
                            new SizedBox(
                              height: 16.0,
                            )
                          ],
                        ),
                      ),

                      new Container(
                        height: 100.0,
                        child: new ListView.builder(
                          itemBuilder: (context, index) {
                            dataObject data = list[index];

                            return new Container(
                              width: 250.0,
                              decoration: new BoxDecoration(
                                  color:
                                      const Color(0xFFF0F1F6).withOpacity(0.9),
                                  borderRadius: BorderRadius
                                      .all(new Radius.circular(5.0))),
                              margin: new EdgeInsets.only(left: 10.0),
                              padding:
                                  new EdgeInsets.only(left: 16.0, right: 16.0),
                              child: new Row(
                                children: <Widget>[
                                  new Image.network(
                                    data.url,
                                    width: 72.0,
                                    height: 72.0,
                                    fit: BoxFit.cover,
                                  ),
                                  new SizedBox(
                                    width: 4.0,
                                  ),
                                  new Expanded(
                                    child: new Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        new SizedBox(
                                          height: 14.0,
                                        ),
                                        new Text(
                                          data.placeName,
                                          style: new TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        new Text(
                                          'Description about this place ${data.placeName}',
                                          style: new TextStyle(
                                              fontSize: 10.0,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ],
                                    ),
                                    flex: 1,
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: list.length,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      new SizedBox(
                        height: 16.0,
                      )
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
