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
      body: Card(
        child: ListTile(
          title: const Text('GetX Bottom Sheet'),
          subtitle: const Text('GetX dialog alert twith getX'),
          onTap: () {
            Get.bottomSheet(
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                ), // BoxDecoration
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.light_mode),
                      title: const Text('Light Theme'),
                      onTap: () {
                        Get.changeTheme(ThemeData.light());
                      },
                    ), // ListTile
                    ListTile(
                      onTap: () {
                        Get.changeTheme(ThemeData.dark());
                      },
                      leading: const Icon(Icons.dark_mode),
                      title: const Text('Dark Theme'),
                    ), // ListTile
                    // ... more ListTiles or widgets ...
                  ],
                ), // Column
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Snack Bar
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

          // Dialog alert
          Get.defaultDialog(
            title: 'Delete Chat',
            titlePadding: const EdgeInsets.only(top: 20),
            contentPadding: const EdgeInsets.all(20),
            middleText: 'Are you sure you want to delete this chat?',
            confirm: TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Ok'),
            ),
            cancel: TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Cancel'),
            ),
          );
        },
      ),
    );
  }
}
