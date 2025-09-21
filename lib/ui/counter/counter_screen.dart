import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes/bloc/counter/counter_bloc.dart';
import 'package:flutter_notes/bloc/counter/counter_events.dart';
import 'package:flutter_notes/bloc/counter/counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Example'), // Title for the AppBar
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // Center children horizontally
        mainAxisAlignment: MainAxisAlignment.center,
        // Center children vertically
        children: [
          // Display the counter value
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Center(
                child: Text(
                  state.counter.toString(), // Display the current counter value
                  style: const TextStyle(
                      fontSize: 60), // Large font size for visibility
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          // Add some vertical space between the text and buttons
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // Center children horizontally within the Row
            mainAxisAlignment: MainAxisAlignment.center,
            // Center children vertically within the Row
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounter());
                },
                child: const Text('Increment'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementCounter());
                },
                child: const Text('Decrement'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
