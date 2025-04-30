import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX'),
      ),
      body: const Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar(
            'Asif Taj',
            'Subscribe to my channel',
            icon: const Icon(Icons.add),
            onTap: (snap) {},
            mainButton:
                TextButton(onPressed: () {}, child: const Text('Click')),
            backgroundColor: Colors.blue,
            snackPosition: SnackPosition.BOTTOM,
          );
        },
      ),
    );
  }
}
