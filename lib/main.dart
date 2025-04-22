import 'package:flutter/material.dart';
import 'package:flutter_notes/convert_latlng_into_address.dart';
import 'package:flutter_notes/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: ConvertLatlngIntoAddress(),
    );
  }
}
