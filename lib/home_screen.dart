import 'package:flutter/material.dart';
import 'package:flutter_notes/counterExample/screens/counter_screen.dart';
import 'package:flutter_notes/counterExample/screens/increment_decrement_screen.dart';
import 'package:flutter_notes/counterExample/screens/list_of_items_screen.dart';
import 'package:flutter_notes/counterExample/screens/stateless_as_stateful_screen.dart';
import 'package:flutter_notes/counterExample/screens/timer_example.dart';

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
        title: const Text('Home Screen'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // We have two types of provider:
            // 1. Single provider
            // 2. Multi provider

            //  Counter example
            button(
              context: context,
              text: 'Counter example',
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const SingleProviderCounterScreen())),
            ),
            const SizedBox(height: 10),
            // Timer example
            button(
              context: context,
              text: 'Timer Provider',
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SingleProviderTimerScreen())),
            ),
            const SizedBox(height: 10),
            // Likeable example
            button(
              context: context,
              text: 'Favorite List Provider',
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LikeableListView())),
            ),
            const SizedBox(height: 10),
            // Increment Decrement Example
            button(
              context: context,
              text: 'Increment Decrement Provider',
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const IncrementDecrementScreen())),
            ),
            // Use stateless widget as stateful
            button(
              context: context,
              text: 'Stateless widget as stateful',
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StatelessAsStatefulScreen())),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton button({
    required BuildContext context,
    required String text,
    required void Function()? onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        textStyle: const TextStyle(fontSize: 12),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
