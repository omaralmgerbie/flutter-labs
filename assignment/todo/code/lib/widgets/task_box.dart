import 'package:flutter/material.dart';

class TaskBox extends StatefulWidget {
  const TaskBox({
    super.key,
    required this.title,
    required this.index,
    required this.onDeletePreesed,
    required this.onUpdatePressed,
  });
  final String title;
  final int index;
  final Function(int) onDeletePreesed;
  final Function(int, String) onUpdatePressed;

  @override
  State<TaskBox> createState() => _TaskBoxState();
}

class _TaskBoxState extends State<TaskBox> {
  bool isChecked = false;

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
            widget.title,
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
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
              IconButton(
                onPressed: () {
                  widget.onUpdatePressed(widget.index, widget.title);
                },
                icon: const Icon(Icons.update),
                color: Colors.green,
              ),
              IconButton(
                onPressed: () {
                  widget.onDeletePreesed(widget.index);
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
