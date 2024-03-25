import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapda_maewo/constant/ctprvn.dart';
import 'package:mapda_maewo/widget/polygon_layer.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double mapSize = context.height * 2;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6, right: 3),
              child: Text("❖", style: TextStyle(fontSize: context.height * 0.04)),
            ),
            Text(
              "Map-da",
              style: TextStyle(
                fontSize: context.height * 0.035,
                letterSpacing: -1,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      body: InteractiveViewer(
        // transformationController: MapController.to.transCtr,
        minScale: 0.3,
        maxScale: 20,
        constrained: false,
        boundaryMargin: EdgeInsets.symmetric(
          vertical: mapSize * 0.2,
          horizontal: mapSize * 0.02,
        ),
        child: Stack(
          children: [
            PolygonLayer(polygons: polygonCtprvn, size: mapSize),
          ],
        ),
      ),
    );
  }
}
