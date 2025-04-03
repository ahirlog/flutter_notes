import 'package:flutter/material.dart';

class DraggableWidgetPage extends StatefulWidget {
  const DraggableWidgetPage({super.key});

  @override
  State<DraggableWidgetPage> createState() => _DraggableWidgetPageState();
}

class _DraggableWidgetPageState extends State<DraggableWidgetPage> {
  double top = 100;
  double left = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable Widget Example'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: top,
            left: left,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  top += details.delta.dy;
                  left += details.delta.dx;
                });
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Drag me',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 