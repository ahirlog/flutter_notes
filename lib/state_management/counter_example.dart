import 'package:flutter/material.dart';
import 'package:flutter_notes/state_management/counter_controller.dart';
import 'package:get/get.dart';

class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  final CounterController controller = Get.put(CounterController());

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Tutorials'),
      ), // AppBar
      body: Center(
        child: Obx(() => Text(controller.counter.toString(),
            style: const TextStyle(fontSize: 60))),
      ), // Center
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.incrementCounter();
        },
        child: const Icon(Icons.add),
      ), // FloatingActionButton
    ); // Scaffold
  }
}
