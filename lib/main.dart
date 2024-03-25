import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapda_maewo/screen/map.screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: '구르메 노트',
      debugShowCheckedModeBanner: false,
      home: MapScreen(),
    );
  }
}
