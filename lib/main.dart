import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes/Utils/image_picker_utils.dart';
import 'package:flutter_notes/bloc/counter/counter_bloc.dart';
import 'package:flutter_notes/bloc/image_picker/image_picker_bloc.dart';
import 'package:flutter_notes/bloc/todo/todo_bloc.dart';
import 'package:flutter_notes/ui/counter/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterBloc()),
          BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
          BlocProvider(create: (_) => ToDoBloc()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
          ),
          home: const CounterScreen(),
        ));
  }
}
