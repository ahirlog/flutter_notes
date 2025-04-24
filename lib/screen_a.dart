import 'package:flutter/material.dart';
import 'package:flutter_notes/routes_name.dart';
import 'package:flutter_notes/screen_b.dart';

class ScreenA extends StatefulWidget {
  const ScreenA({super.key});

  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Screen A',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const ScreenB()));
                Navigator.pushNamed(context, RouteName.screenB);
              },
              child: const Text('Click Me'),
            ),
          ],
        ),
      ),
    );
  }
}
