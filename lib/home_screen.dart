import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;
  final List<Map<String, dynamic>> _items = [
    {
      'icon': Icons.note,
      'title': 'Meeting Notes',
      'description': 'Notes from team meeting discussing project timeline',
    },
    {
      'icon': Icons.shopping_cart,
      'title': 'Shopping List',
      'description': 'Groceries and household items to buy',
    },
    {
      'icon': Icons.task,
      'title': 'Todo List',
      'description': 'Tasks to complete for the week',
    },
    {
      'icon': Icons.book,
      'title': 'Book Summary',
      'description': 'Key points from recent book reading',
    },
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildShimmerItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 12,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(Map<String, dynamic> item) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(item['icon'] as IconData),
      ),
      title: Text(
        item['title'] as String,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Text(item['description'] as String),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        centerTitle: true,
      ),
      body: _isLoading
          ? ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) => _buildShimmerItem(),
            )
          : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) => _buildListItem(_items[index]),
            ),
    );
  }
}
