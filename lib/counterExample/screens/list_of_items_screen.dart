import 'package:flutter/material.dart';
import 'package:flutter_notes/counterExample/provider/likeable_list_provider.dart';
import 'package:provider/provider.dart';

class LikeableListView extends StatefulWidget {
  const LikeableListView({super.key});

  @override
  State<LikeableListView> createState() => _LikeableListViewState();
}

class _LikeableListViewState extends State<LikeableListView> {
  // Sample list of items
  final List<LikeableListItem> items = [
    LikeableListItem(name: "Item 1"),
    LikeableListItem(name: "Item 2"),
    LikeableListItem(name: "Item 3"),
    LikeableListItem(name: "Item 4"),
    LikeableListItem(name: "Item 5"),
    LikeableListItem(name: "Item 6"),
    LikeableListItem(name: "Item 8"),
    LikeableListItem(name: "Item 9"),
    LikeableListItem(name: "Item 10"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Likeable Items List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Consumer<LikeableListProvider>(
                builder: (context, value, child) {
              return ListTile(
                title: Text(
                  items[index].name,
                  style: const TextStyle(fontSize: 18),
                ),
                trailing: IconButton(
                  icon: Icon(
                    value.selectedItem.contains(index)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: items[index].isLiked ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    if (value.selectedItem.contains(index)) {
                      value.removeItem(index);
                    } else {
                      value.addItem(index);
                    }
                  },
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

class LikeableListItem {
  final String name;
  bool isLiked;

  LikeableListItem({required this.name, this.isLiked = false});
}
