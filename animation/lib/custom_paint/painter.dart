import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double w = size.width;
    double h = size.height;

    Paint brush = Paint();
    brush.color = Colors.red;
    brush.strokeWidth = 5;
    brush.strokeCap = StrokeCap.round;

    /// making a triangle
    Path triangle = Path();
    triangle.lineTo(w, 0);

    triangle.lineTo(0, h);
    triangle.lineTo(0, 0);
    triangle.close();

    canvas.drawPath(triangle, brush);
    canvas.drawCircle(Offset(250, 250), 30, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
