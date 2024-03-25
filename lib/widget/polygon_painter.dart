import 'package:flutter/material.dart';

class PolygonPainter extends CustomPainter {
  final List<Offset> outerPoints;
  final List<List<Offset>> innerPointsList;
  final double scale;
  final double strokeWidth;
  final double fillOpacity;
  final Color color;

  PolygonPainter({
    this.outerPoints = const [],
    this.innerPointsList = const [],
    this.scale = 1,
    this.strokeWidth = 0.2,
    this.fillOpacity = 0.3,
    this.color = Colors.blueGrey,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final Paint fillPaint = Paint()
      ..color = color.withOpacity(fillOpacity)
      ..style = PaintingStyle.fill;

    final Path path = _createPath(outerPoints, scale);

    for (List<Offset> innerPoints in innerPointsList) {
      final Path innerPath = _createPath(innerPoints, scale);
      path.addPath(innerPath, Offset.zero);
    }

    canvas.drawPath(path, linePaint);
    canvas.drawPath(path, fillPaint);
  }

  Path _createPath(List<Offset> points, double scale) {
    final Path path = Path();
    if (points.isNotEmpty) {
      path.moveTo(points.first.dx * scale, points.first.dy * scale);
      for (Offset point in points) {
        path.lineTo(point.dx * scale, point.dy * scale);
      }
      path.close();
    }
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
