import 'package:flutter/material.dart';
import 'package:flutter_notes/counterExample/screens/counter_screen.dart';
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
            // 1. Single provider: Counter example
            button(
                context: context,
                text: 'Single Provider: Counter example',
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const SingleProviderCounterScreen()))),
            const SizedBox(height: 10),
            // 2. Single provider: Timer example
            button(
                context: context,
                text: 'Single Provider: Timer Provider',
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const SingleProviderTimerScreen()))),
            // 2. Multi provider
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            //     textStyle: const TextStyle(fontSize: 20),
            //   ),
            //   onPressed: () {
            //     // Navigator.push(
            //     //   context,
            //     //   MaterialPageRoute(
            //     //     builder: (context) => const SecondScreen(),
            //     //   ),
            //     // );
            //   },
            //   child: const Text('Second Screen'),
            // ),
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
