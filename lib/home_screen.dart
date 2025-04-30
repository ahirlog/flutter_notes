import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

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
          FutureBuilder(
            future: Hive.openBox('asif'),
            builder: (context, snapshot) {
              return Column(
                children: [
                  ListTile(
                    title: Text(snapshot.data!.get('age').toString()),
                    trailing: IconButton(
                      onPressed: () {
                        // delete data
                        snapshot.data!.delete('age');

                        // edit data
                        // snapshot.data!.put('age', '20');
                        setState(() {});
                      },
                      icon: const Icon(Icons.edit),
                    ), // IconButton
                  ), // ListTile
                ],
              ); // Column
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var box = await Hive.openBox('asif');
          var box2 = await Hive.openBox('name');

          // add data
          box.put('age', 25);
          box.put('details', {
            'pro': 'developer',
            'kash': 'sdfsdf',
          });

          box2.put('youtube', 'Asif Taj Tech');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
