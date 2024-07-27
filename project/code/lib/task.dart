// Define a custom class for a Task object
class Task {
  String title;
  String description;
  bool isDone;

  Task({required this.title, required this.description, this.isDone = false});
}