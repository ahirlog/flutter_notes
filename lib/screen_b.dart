import 'package:flutter/material.dart';
import 'package:flutter_notes/routes_name.dart';
import 'package:flutter_notes/screen_c.dart';

class ScreenB extends StatefulWidget {
  const ScreenB({super.key});

  @override
  State<ScreenB> createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Screen B',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const ScreenC()));
                Navigator.pushNamed(context, RouteName.screenC);
              },
              child: const Text('Click Me'),
            ),
          ],
        ),
      ),
    );
  }
}
