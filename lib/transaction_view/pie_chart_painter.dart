// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

class ArcValueModel {
  final Color color;
  final double value;

  ArcValueModel({
    required this.color,
    required this.value,
  });
}

class PieChartPainter extends CustomPainter {
  final double start;
  final double end;
  final double width;
  final double blurWidth;
  final List<ArcValueModel> drwArcs;
  final double space;
  PieChartPainter({
    required this.drwArcs,
    this.start = 0,
    this.end = 360,
    this.width = 15,
    this.blurWidth = 6,
    this.space = 100,
  });
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height * 1.7),
        radius: size.width / 1.98);

    var gradientColor = LinearGradient(
        colors: [Color.fromARGB(0, 7, 7, 8), Color.fromARGB(0, 7, 7, 8)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);

    Paint backgroundPaint = Paint()
      ..color = Color.fromARGB(0, 7, 7, 8)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;
    canvas.drawArc(rect, radians(360), radians(380), false, backgroundPaint);

    var startVal = 360 + start;
    var drawStart = startVal;
    for (var arcObj in drwArcs) {
      var endVal = drawStart + arcObj.value;
      Paint activePaint = Paint()
        ..color = arcObj.color
        ..strokeWidth = 25;
      activePaint.style = PaintingStyle.stroke;
      activePaint.strokeCap = StrokeCap.round;

      Path path = Path();
      path.addArc(rect, radians(drawStart), radians(arcObj.value));
      canvas.drawArc(
          rect, radians(drawStart), radians(arcObj.value), false, activePaint);
      drawStart = endVal;
    }
  }

  @override
  bool shouldRepaint(PieChartPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(PieChartPainter oldDelegate) => false;
}
