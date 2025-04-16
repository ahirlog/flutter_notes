import 'package:flutter/material.dart';
import 'package:flutter_notes/db_handler.dart';
import 'package:flutter_notes/notes.dart' show NotesModel;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DBHelper? dbHelper;
  late Future<List<NotesModel>> notesList;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  loadData() async {
    notesList = dbHelper!.getNotesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite DB'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: notesList,
                builder: (context, AsyncSnapshot<List<NotesModel>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            dbHelper!.update(
                              NotesModel(
                                id: snapshot.data![index].id!,
                                title: 'First flitter note',
                                age: 11,
                                description: 'let me talk to you tomorrow',
                                email: 'asf@gmail.com',
                              ),
                            );
                            setState(() {
                              notesList = dbHelper!.getNotesList();
                            });
                          },
                          child: Dismissible(
                            direction: DismissDirection.endToStart,
                            background: Container(
                              color: Colors.red,
                              child: const Icon(Icons.delete),
                            ),
                            onDismissed: (DismissDirection direction) {
                              setState(() {
                                dbHelper!.delete(snapshot.data![index].id!);
                                notesList = dbHelper!.getNotesList();
                                snapshot.data!.removeAt(index);
                              });
                            },
                            key: ValueKey<int>(snapshot.data![index].id!),
                            child: Card(
                              child: ListTile(
                                title:
                                    Text(snapshot.data![index].title.toString()),
                                subtitle: Text(
                                    snapshot.data![index].description.toString()),
                                trailing:
                                    Text(snapshot.data![index].age.toString()),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dbHelper!
              .insert(NotesModel(
                  title: 'First Note',
                  age: 22,
                  description: 'This is my first sql app',
                  email: 'axiftaj@gmaol.com'))
              .then((value) {
            print('data added');
            setState(() {
              notesList = dbHelper!.getNotesList();
            });
          }).onError((error, stackTrace) {
            print(error.toString());
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
