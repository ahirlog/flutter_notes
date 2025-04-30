import 'package:flutter/material.dart';
import 'package:flutter_notes/boxes/boxes.dart';
import 'package:flutter_notes/model/notes_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
      body: ValueListenableBuilder<Box<NotesModel>>(
        valueListenable: Boxes.getData().listenable(),
        builder: (context, box, _) {
          final data = box.values.toList().cast<NotesModel>();
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            data[index].title.toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              delete(data[index]);
                            },
                            child: const Icon(Icons.delete, color: Colors.red),
                          ),
                          const SizedBox(width: 15),
                          InkWell(
                              onTap: () {
                                _editDialog(
                                    data[index],
                                    data[index].title.toString(),
                                    data[index].description.toString());
                              },
                              child: const Icon(Icons.edit)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data[index].description.toString(),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ), // Column
                ), // Padding
              ); // Card
            },
          ); // ListView.builder
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showMyDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void delete(NotesModel notesModel) async {
    await notesModel.delete();
  }

  Future<void> _editDialog(
      NotesModel notesModel, String title, String description) async {
    titleController.text = title;
    descriptionController.text = description;

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
                notesModel.title = titleController.text.toString();
                notesModel.description = descriptionController.text.toString();

                notesModel.save();

                titleController.clear();
                descriptionController.clear();
                Navigator.pop(context);
              },
              child: const Text('Edit'),
            ),
          ],
        ); // AlertDialog
      },
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
                // data.save();

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
