import 'package:flutter/rendering.dart';

class MyClipper extends CustomClipper<Path> {
  List<Offset> _extractPoints(String clipPath, Size size) {
    final points = List<Offset>.empty(growable: true);
    var tempString = clipPath.replaceAll("%", "");
    tempString = tempString.replaceAll(", ", ",");
    final pointString = tempString.split(",");

    for (final pointString in pointString) {
      final coord = pointString.split(" ");

      if (coord.length == 2) {
        points.add(Offset((double.parse(coord[0]) * size.width / 100),
            (double.parse(coord[1]) * size.height / 100)));
      }
    }
    return points;
  }

  @override
  Path getClip(Size size) {
    Path path = Path();
    const clipPath =
        "0% 0%, 0% 100%, 25% 100%, 25% 25%, 75% 25%, 75% 75%, 25% 75%, 25% 100%, 100% 100%, 100% 0%";
    final points = _extractPoints(clipPath, size);
    path.addPolygon(points, true);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
