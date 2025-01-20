import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_notes/counterExample/provider/increment_decrement_provider.dart';
import 'package:provider/provider.dart';

class IncrementDecrementScreen extends StatelessWidget {
  const IncrementDecrementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log('djvj');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Increment Decrement Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.watch<IncrementDecrementProvider>().count.toString(),
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                fontFamily: 'monospace',
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                  ),
                  onPressed: () {
                    context.read<IncrementDecrementProvider>().incrementCount();
                  },
                  child: const Text('+'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                  ),
                  onPressed: () {
                    context.read<IncrementDecrementProvider>().decrementCount();
                  },
                  child: const Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
