import 'dart:math';

import 'package:flutter/material.dart';
import 'package:transactions/utils/extensions/extensions.dart';

import '../../../models/donut_data.dart';

class DonutPainter extends CustomPainter {
  final List<DonutData> data;
  final double totalValue;

  DonutPainter(this.data)
      : totalValue = data.map((item) => item.total).reduce((a, b) => a + b);

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = min(centerX, centerY);

    double startAngle = -pi / 2;
    double endAngle;

    const double ringThickness = 50;

    for (var index = 0; index < data.length; index++) {
      final paint = Paint()
        ..color = data[index].transactionType.color()
        ..style = PaintingStyle.stroke
        ..strokeWidth = ringThickness;

      endAngle = startAngle + 2 * pi * data[index].total / totalValue;

      canvas.drawArc(
          Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
          startAngle,
          endAngle - startAngle,
          false,
          paint);

      startAngle = endAngle;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
