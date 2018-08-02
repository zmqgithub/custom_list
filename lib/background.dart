// This code is copied from here with minor costomization
//  https://github.com/alessandroaime/Weather

import 'package:flutter/material.dart';

class Background extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    _drawSky(canvas, size);
    _drawArc(canvas, size, 0.0, 30.0, 50.0, 1.0);
    _drawArc(canvas, size, 50.0, 145.0, 145.0, 0.35);
    _drawArc(canvas, size, 145.0, 80.0, 145.0, 0.35);
    _drawArc(canvas, size, 80.0, 50.0, 95.0, 0.35);
    _drawArc(canvas, size, 200.0, 350.0, 95.0, 0.30);
    _drawArc(canvas, size, size.height / 3, 8 * size.height / 10, 295.0, 0.20);
  }

  _drawArc(Canvas canvas, Size size, double pathLineToHeight,
      double endPointHeight, double controlPointHeight, double opacity) {
    var path = new Path();
    path.moveTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - pathLineToHeight);

    var endPoint = new Offset(0.0, size.height - endPointHeight);
    var controlPoint =
        new Offset(size.width / 4, size.height - controlPointHeight);
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.close();

    canvas.drawPath(
      path,
      new Paint()..color = Colors.white.withOpacity(opacity),
    );
  }

  _getSkyColors() {
    DateTime now = new DateTime.now();
    int timeAsMins = now.hour * 60 + now.minute;
    var lerpValue =
        (timeAsMins <= 720) ? timeAsMins / 720 : (2 - timeAsMins / 720);
    var topSkyColor =
        Color.lerp(Colors.indigo.shade700, Colors.green, lerpValue);
    var bottomSkyColor = Color
        .lerp(
            Colors.indigo.shade100, Colors.lightBlueAccent.shade100, lerpValue)
        .withOpacity(0.8);
    return [topSkyColor, bottomSkyColor];
  }

  _drawSky(Canvas canvas, Size size) {
    var skyGradient = new LinearGradient(
      colors: _getSkyColors(),
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    canvas.drawRect(
      new Rect.fromLTWH(0.0, 0.0, size.width, size.height),
      new Paint()
        ..shader = skyGradient.createShader(
          new Rect.fromLTWH(0.0, 0.0, size.width, size.height),
        ),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
