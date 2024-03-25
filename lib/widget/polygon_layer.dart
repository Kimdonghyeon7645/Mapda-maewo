import 'package:flutter/material.dart';
import 'package:mapda_maewo/widget/polygon_painter.dart';

class PolygonLayer extends StatelessWidget {
  const PolygonLayer({
    super.key,
    required this.polygons,
    required this.size,
    this.active = false,
    this.level = "ctprvn",
  });

  final List polygons;
  final double size;
  final bool active;
  final String level;

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: active,
      child: Stack(
        children: [
          for (var polygon in polygons)
            for (var polys in polygon["polygons"])
              RepaintBoundary(
                child: CustomPaint(
                  size: Size(size, size),
                  painter: PolygonPainter(
                    outerPoints: _getOutterPoints(polys),
                    innerPointsList: _getInnerPointsList(polys),
                    scale: size / 100,
                  ),
                ),
              ),
        ],
      ),
    );
  }

  List<Offset> _getOutterPoints(polys) {
    return polys[0].map<Offset>((e) => Offset(e[0], e[1])).toList();
  }

  List<List<Offset>> _getInnerPointsList(polys) {
    if (polys.length < 2) return [];
    return polys.sublist(1).map<List<Offset>>((poly) {
      return (poly as List<dynamic>).map<Offset>((e) => Offset(e[0], e[1])).toList();
    }).toList();
  }
}
