import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();

    path_0.moveTo(0, 0);
    path_0.cubicTo(
        size.width * 0.1256000,
        size.height * 0.0094000,
        size.width * 0.1206250,
        size.height * 0.3255333,
        size.width * 0.2500000,
        size.height * 0.3333333);
    path_0.cubicTo(
        size.width * 0.3743250,
        size.height * 0.3166000,
        size.width * 0.3757000,
        size.height * 0.0030667,
        size.width * 0.5000000,
        0);
    path_0.cubicTo(
        size.width * 0.6243250,
        size.height * 0.0030667,
        size.width * 0.6190750,
        size.height * 0.3258667,
        size.width * 0.7500000,
        size.height * 0.3333333);
    path_0.cubicTo(size.width * 0.8743250, size.height * 0.3392000,
        size.width * 0.8756000, size.height * 0.0076667, size.width, 0);
    path_0.quadraticBezierTo(
        size.width, size.height * 0.2500000, size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.quadraticBezierTo(0, size.height * 0.7500000, 0, 0);
    path_0.close();
    /*
    var firstStart = Offset(size.width/5, 0);
    var firstEnd = Offset(size.width/2.25, 50);
    var SecondStart = Offset(size.width-(size.width/3.24), 105);
    var SecondEnd = Offset(size.width, 10);
    var thirdStart = Offset(size.width/5, 0);
    path_0.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    path_0.quadraticBezierTo(SecondStart.dx, SecondStart.dy, SecondEnd.dx, SecondEnd.dy);
    */

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
