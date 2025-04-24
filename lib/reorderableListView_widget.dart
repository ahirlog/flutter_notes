import 'package:flutter/material.dart';

class ReorderablelistviewWidget extends StatefulWidget {
  const ReorderablelistviewWidget({super.key});

  @override
  State<ReorderablelistviewWidget> createState() =>
      _ReorderablelistviewWidgetState();
}

class _ReorderablelistviewWidgetState extends State<ReorderablelistviewWidget> {
  final List<String> _productList = [
    'Apple',
    'Mango',
    'Orange',
    'Banana',
    'Straberry',
    'Cherry'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ReorderableListView.builder(
        itemBuilder: (context, index) {
          return Card(
            key: ValueKey(_productList[index]),
            child: ListTile(
              title: Text(_productList[index]),
            ),
          );
        },
        itemCount: _productList.length,
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex = newIndex - 1;
            }
            final item = _productList.removeAt(oldIndex);
            _productList.insert(newIndex, item);
          });
        },
      ),
    );
  }
}
