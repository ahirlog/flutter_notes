import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_notes/counterExample/provider/counter_provider.dart';
import 'package:provider/provider.dart';

class SingleProviderCounterScreen extends StatefulWidget {
  const SingleProviderCounterScreen({super.key});

  @override
  State<SingleProviderCounterScreen> createState() =>
      _SingleProviderCounterScreenState();
}

class _SingleProviderCounterScreenState
    extends State<SingleProviderCounterScreen> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CounterProvider>(context, listen: false);
    log('test');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterProvider>(builder: (context, value, child) {
              return Text(
                value.count.toString(),
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
                countProvider.setCount();
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
