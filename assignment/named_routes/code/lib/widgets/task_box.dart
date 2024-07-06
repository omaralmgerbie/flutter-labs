import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskBox extends StatefulWidget {
  const TaskBox(
      {super.key,
      required this.task,
      required this.onDeletePreesed,
      required this.onUpdatePressed,
      required this.isDone});
  final Task task;
  final void Function(int) onDeletePreesed;
  final void Function(Task) onUpdatePressed;
  final void Function(Task) isDone;

  @override
  State<TaskBox> createState() => _TaskBoxState();
}

class _TaskBoxState extends State<TaskBox> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue[100],
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.task.title,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.blue[900],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  widget.isDone(Task(
                      title: widget.task.title,
                      id: widget.task.id,
                      isDone: value!));
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              IconButton(
                onPressed: () {
                  widget.onUpdatePressed(widget.task);
                },
                icon: const Icon(Icons.update),
                color: Colors.green,
              ),
              IconButton(
                onPressed: () {
                  widget.onDeletePreesed(widget.task.id ?? 0);
                },
                icon: const Icon(Icons.delete),
                color: Colors.red,
              ),
            ],
          )
        ],
      ),
    );
  }
}
