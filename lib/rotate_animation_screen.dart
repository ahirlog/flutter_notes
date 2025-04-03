import 'package:flutter/material.dart';

class RotateAnimationScreen extends StatefulWidget {
  const RotateAnimationScreen({super.key});

  @override
  _RotateAnimationScreenState createState() => _RotateAnimationScreenState();
}

class _RotateAnimationScreenState extends State<RotateAnimationScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotate Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 2.0 * 3.141592653589793,
              child: child,
            );
          },
          child: const Icon(
            Icons.ac_unit,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
