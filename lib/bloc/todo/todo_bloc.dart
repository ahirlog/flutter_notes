import 'package:bloc/bloc.dart';
import 'package:flutter_notes/bloc/todo/todo_event.dart';
import 'package:flutter_notes/bloc/todo/todo_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final List<String> todos = [];

  ToDoBloc() : super(const ToDoState()) {
    on<AddTodoEvent>(_addToEvent);
    on<RemoveTodoEvent>(_removeEvent);
  }

  void _addToEvent(AddTodoEvent event, Emitter<ToDoState> emit) {
    todos.add(event.task);
    emit(state.copyWith(todos: List.from(todos)));
  }

  void _removeEvent(RemoveTodoEvent event, Emitter<ToDoState> emit) {
    todos.remove(event.index);
    emit(state.copyWith(todos: List.from(todos)));
  }
}
