import 'package:flutter/material.dart';
import 'package:flutter_notes/screen_b.dart';
import 'package:get/get.dart';

class SereenA extends StatefulWidget {
  const SereenA({super.key});

  @override
  State<SereenA> createState() => _SereenAState();
}

class _SereenAState extends State<SereenA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InkWell(
        onTap: () {
          Get.to(const ScreenB(
            name: 'Rahul',
          ));
        },
        child: const Text('Next screen'),
      ),
    );
  }
}
