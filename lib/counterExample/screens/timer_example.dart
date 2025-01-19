import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_notes/counterExample/provider/timer_provider.dart';
import 'package:provider/provider.dart';

class SingleProviderTimerScreen extends StatefulWidget {
  const SingleProviderTimerScreen({super.key});

  @override
  State<SingleProviderTimerScreen> createState() =>
      _SingleProviderTimerScreenState();
}

class _SingleProviderTimerScreenState extends State<SingleProviderTimerScreen> {
  @override
  void initState() {
    final countProvider = Provider.of<TimerProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('test');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Timer Screen'),
      ),
      body: Center(
        child: Consumer<TimerProvider>(builder: (context, value, child) {
          return Text(
            value.count.toString(),
            style: const TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              fontFamily: 'monospace',
            ),
          );
        }),
      ),
    );
  }
}
