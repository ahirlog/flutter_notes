import 'package:flutter/material.dart';
import 'package:flutter_notes/boxes/boxes.dart';
import 'package:flutter_notes/model/notes_model.dart';

class ModelExampleScreen extends StatefulWidget {
  const ModelExampleScreen({super.key});

  @override
  State<ModelExampleScreen> createState() => _ModelExampleScreenState();
}

class _ModelExampleScreenState extends State<ModelExampleScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Model Hive Example'),
      ),
      body: Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showMyDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add NOTES'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Enter title',
                    border: OutlineInputBorder(),
                  ), // InputDecoration
                ),
                // TextFormField
                const SizedBox(height: 20),
                TextFormField(
                  maxLines: 5,
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Enter description',
                    border: OutlineInputBorder(),
                  ), // InputDecoration
                ),
                // TextFormField
              ],
            ), // ListView
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final data = NotesModel(
                    title: titleController.text,
                    description: descriptionController.text);
                final box = Boxes.getData();

                box.add(data);
                data.save();

                print(box);
                titleController.clear();
                descriptionController.clear();

                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        ); // AlertDialog
      },
    );
  }
}
