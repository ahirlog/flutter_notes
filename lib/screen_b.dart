import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ScreenB extends StatefulWidget {
  final String name;
  const ScreenB({super.key, required this.name});

  @override
  State<ScreenB> createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InkWell(
        onTap: () {
          Get.back();
        },
        child: const Text('Previous screen'),
      ),
    );
  }
}
