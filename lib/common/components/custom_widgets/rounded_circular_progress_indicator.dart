import 'package:flutter/cupertino.dart';

import 'package:vector_math/vector_math.dart' as math;

class _CircularProgress extends CustomPainter {
  const _CircularProgress({
    required this.backColor,
    required this.frontColor,
    required this.strokeWidth,
    required this.value,
  });

  final Color backColor, frontColor;
  final double strokeWidth, value;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width, h = size.height;
    final paint1 = Paint()
      ..strokeWidth = strokeWidth
      ..color = backColor
      ..style = PaintingStyle.stroke;
    final paint2 = Paint()
      ..strokeWidth = strokeWidth
      ..color = frontColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final r =
    Rect.fromCenter(center: Offset(w / 2, h / 2), width: w, height: h);

    canvas.drawArc(r, math.radians(0), math.radians(360), false, paint1);
    canvas.drawArc(
        r, math.radians(270), math.radians(360 * value), false, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RoundedCircularProgressIndicator extends StatelessWidget {
  const RoundedCircularProgressIndicator(
      {super.key,
        required this.backgroundColor,
        required this.strokeColor,
        required this.strokeWidth,
        required this.value});

  final Color backgroundColor;
  final Color strokeColor;
  final double strokeWidth;
  final double value;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CircularProgress(
        backColor: backgroundColor,
        frontColor: strokeColor,
        strokeWidth: strokeWidth,
        value: value,
      ),
    );
  }
}
