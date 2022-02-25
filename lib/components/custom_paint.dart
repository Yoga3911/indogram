import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width * 0.0012500, size.height * 0.5000000);
    path0.quadraticBezierTo(size.width * 0.0759375, size.height * 0.6375000,
        size.width * 0.1284375, size.height * 0.4812500);
    path0.cubicTo(
        size.width * 0.2118750,
        size.height * 0.2225000,
        size.width * 0.3158625,
        size.height * 0.2878000,
        size.width * 0.3762500,
        size.height * 0.4900000);
    path0.cubicTo(
        size.width * 0.5115625,
        size.height * 0.7412500,
        size.width * 0.6212500,
        size.height * 0.7125000,
        size.width * 0.6925000,
        size.height * 0.4950000);
    path0.quadraticBezierTo(size.width * 0.8096125, size.height * 0.1000000,
        size.width * 0.9984375, size.height * 0.4900000);
    path0.lineTo(size.width, size.height * 0.0112500);
    path0.lineTo(0, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
