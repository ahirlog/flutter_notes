import 'package:flutter/material.dart';

class AnimatedListview extends StatefulWidget {
  const AnimatedListview({super.key});

  @override
  State<AnimatedListview> createState() => _AnimatedListviewState();
}

class _AnimatedListviewState extends State<AnimatedListview> {
  final listKey = GlobalKey<AnimatedListState>();
  List<int> item = [];
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              listKey.currentState!.removeItem(
                  0, (context, animation) => sizeIt(context, 0, animation),
                  duration: const Duration(milliseconds: 400));
              item.removeAt(0);
            },
            icon: const Icon(Icons.remove_circle_outline),
          ) // IconButton
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          listKey.currentState!
              .insertItem(0, duration: const Duration(milliseconds: 400));
          item = []
            ..add(count++)
            ..addAll(item);
        },
      ),
      body: SafeArea(
        child: AnimatedList(
          key: listKey,
          initialItemCount: item.length,
          itemBuilder: (context, index, animation) {
            return sizeIt(context, index, animation);
          },
        ),
      ),
    );
  }

  Widget sizeIt(BuildContext context, int index, animation) {
    int newItem = item[index];
    return SizeTransition(
      sizeFactor: animation,
      axis: Axis.vertical,
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: Card(
          color: Colors.primaries[index % Colors.primaries.length],
          child: Text('item ${newItem.toString()}',
              style: Theme.of(context).textTheme.headlineSmall),
        ), // Card
      ), // SizedBox
    );
  }

  Widget slideIt(BuildContext context, int index, animation) {
    int newItem = item[index];
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: const Offset(0, 0),
      ).animate(animation),
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: Card(
          color: Colors.primaries[index % Colors.primaries.length],
          child: Text('item ${newItem.toString()}',
              style: Theme.of(context).textTheme.headlineSmall),
        ), // Card
      ), // SizedBox
    );
  }
}
