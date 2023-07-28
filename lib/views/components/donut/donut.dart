import 'package:flutter/material.dart';

import '../../../models/donut_data.dart';
import 'donut_diagram_painter.dart';

class Donut extends StatelessWidget {
  final List<DonutData> data;

  const Donut(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DonutPainter(data),
      child: Container(),
    );
  }
}
