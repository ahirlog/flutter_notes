import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
           Container(
            height: 50,
             width: double.infinity,
             color: Colors.red,
          ),
          20.ph,
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.red,
          ),
          20.ph,
          Container(
            height: 50,
            width: double.infinity,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}

extension Padding on num {
  SizedBox get ph => SizedBox(height:toDouble());
  SizedBox get pw => SizedBox(width:toDouble());
}
