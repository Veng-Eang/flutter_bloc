import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/feature/todo_app/models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);
  void addTodo(String title) {
    Todo todo = Todo(name: title, createAt: DateTime.now());
    emit([...state, todo]);
  }
}
