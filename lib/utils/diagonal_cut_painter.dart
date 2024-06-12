import 'package:flutter/material.dart';

import 'colors.dart';

class DiagonalCutPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke;

    Gradient borderGradient = LinearGradient(
      colors: [
        RnMColors.primaryColor.withOpacity(0.7),
        RnMColors.secondaryColor.withOpacity(0.7)
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final borderPaint = Paint()
      ..shader = borderGradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = .5;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 1)
      ..lineTo(size.width, size.height * 0.83)
      ..lineTo(size.width * 0.7, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
