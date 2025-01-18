import 'package:flutter/material.dart';
import 'package:flutter_notes/counterExample/provider/counter_provider.dart';
import 'package:flutter_notes/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: const MaterialApp(
        title: 'Flutter Notes',
        home: HomeScreen(),
      ),
    );
  }
}
