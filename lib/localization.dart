import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Localization extends StatefulWidget {
  const Localization({super.key});

  @override
  State<Localization> createState() => _LocalizationState();
}

class _LocalizationState extends State<Localization> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            title: Text('message'.tr),
            subtitle: Text('name'.tr),
          ), // ListTile
          const SizedBox(height: 50),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {
                  Get.updateLocale(const Locale('en', 'US'));
                },
                child: const Text('English'),
              ),
              OutlinedButton(
                  onPressed: () {
                    Get.updateLocale(const Locale('hi', 'IN'));
                  },
                  child: const Text('India')),
            ],
          ), // Row
        ],
      ),
    );
  }
}
