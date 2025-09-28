import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes/bloc/todo_bloc.dart';
import 'package:flutter_notes/bloc/todo_event.dart';
import 'package:flutter_notes/bloc/todo_state.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if (state.todos.isEmpty) {
            return const Center(
              child: Text('No todos yet.'),
            );
          } else if (state.todos.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todos[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      BlocProvider.of<ToDoBloc>(context)
                          .add(RemoveTodoEvent(state.todos[index]));
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Unknown state.'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 10; i++) {
            BlocProvider.of<ToDoBloc>(context).add(AddTodoEvent('Task $i'));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
