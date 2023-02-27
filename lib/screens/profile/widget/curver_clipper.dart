import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

//curveclipper for profile screen design

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 4 * size.height / 5);

    Offset curvePoint = Offset(size.width / 2, size.height / 3);

    Offset endPoint = Offset(size.width, 4 * size.height / 5);

    path.quadraticBezierTo(
        curvePoint.dx, curvePoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
