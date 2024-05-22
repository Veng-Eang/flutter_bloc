import 'package:flutter/material.dart';
import 'package:learn_flutter/feature/login_form/page/login.dart';
import 'package:learn_flutter/feature/todo_app/page/add_todo.dart';
import 'package:learn_flutter/feature/todo_app/page/todo_list.dart';

class Routes {
  static Route<dynamic> generateRout(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            return const TodoList();
          }),
        );
      case '/add-todo':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            return const AddTodoPage();
          }),
        );
      case '/login':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            return const LoginPage();
          }),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, contstraints) {
            return const TodoList();
          }),
        );
    }
  }
}
