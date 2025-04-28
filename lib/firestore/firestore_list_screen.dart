import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/firestore/add_firestore_data.dart';
import 'package:flutter_notes/ui/add_post_screen.dart';
import 'package:flutter_notes/utils/utils.dart';

class FireStoreListScreen extends StatefulWidget {
  const FireStoreListScreen({super.key});

  @override
  State<FireStoreListScreen> createState() => _FireStoreListScreenState();
}

class _FireStoreListScreenState extends State<FireStoreListScreen> {
  final editController = TextEditingController();

  Future<void> _logout() async {
    await FirebaseAuth.instance.signOut().then((_) {
      Navigator.pushReplacementNamed(context, '/login');
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddFireStoreData()));
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          // fetch using FirebaseAnimatedList widget
          Expanded(
            child: ListView(),
          ),
        ],
      ),
    );
  }

  Future<void> showMyDialog(String title, String id) async {
    editController.text = title;

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update'),
          content: TextField(
            controller: editController,
            decoration: const InputDecoration(
              hintText: 'Edit',
            ), // InputDecoration
          ), // Container
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ), // TextButton
            TextButton(
              onPressed: () {
                Navigator.pop(context);

              },
              child: const Text('Update'),
            ), // TextButton
          ],
        ); // AlertDialog
      },
    );
  }
}
