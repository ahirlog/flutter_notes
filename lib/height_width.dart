import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeightWidth extends StatefulWidget {
  const HeightWidth({super.key});

  @override
  State<HeightWidth> createState() => _HeightWidthState();
}

class _HeightWidthState extends State<HeightWidth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: Get.height * 0.5,
        width: Get.width * 0.8,
        color: Colors.green,
        child: const Center(
          child: Text('Center'),
        ), // Center
      ),
    );
  }
}
