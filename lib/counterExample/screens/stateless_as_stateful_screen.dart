import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatelessAsStatefulScreen extends StatelessWidget {
  StatelessAsStatefulScreen({super.key});

  final _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless as Stateful'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, child) {
                  return Text(
                    value.toString(),
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'monospace',
                    ),
                  );
                }),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
              ),
              onPressed: () {
                _counter.value++;
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
