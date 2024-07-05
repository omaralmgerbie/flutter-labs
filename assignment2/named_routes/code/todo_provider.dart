import 'package:flutter/material.dart';
import 'package:flutter_project2/models/todo.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Future<void> addTodoAsync(String title) async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    _todos.add(Todo(title: title));
    notifyListeners();
  }

  void addTodo(String title) {
    _todos.add(Todo(title: title));
    notifyListeners();
  }

  void updateTodo(Todo todo, String title) {
    todo.title = title;
    notifyListeners();
  }

  void toggleTodoStatus(Todo todo) {
    todo.isCompleted = !todo.isCompleted;
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}
