import 'package:flutter/material.dart';
import 'package:flutter_notes/state_management/counter_controller.dart';
import 'package:get/get.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Obx(() => Container(
                height: 200,
                width: 200,
                color: Colors.red.withOpacity(counterController.opacity.value),
              )), // Container, Obx
          Obx(() => Slider(
                value: counterController.opacity.value,
                onChanged: (value) {
                  print(value);
                  counterController.setOpacity(value);
                },
              )), // Slider, Obx
        ],
      ),
    );
  }
}
