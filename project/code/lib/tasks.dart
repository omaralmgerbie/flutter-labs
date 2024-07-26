import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
    );
  }
}

class TasksPage extends StatefulWidget {
  @override
  _TasksPageState createState() => _TasksPageState();
}



class _TasksPageState extends State<TasksPage> {

  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks',

          style: TextStyle(

            color: Colors.white,

            fontWeight: FontWeight.bold,

            fontSize: 40.0, 
            // Set the font size to be twice the default (24.0)
          ),
        ),

        centerTitle: true, 
        // Center the title in the app bar
        backgroundColor: Color(0xFF01977F), 
        // Set the background color of the app bar
      ),







      body: ListView.builder(

        itemCount: tasks.length,

        itemBuilder: (context, index) {

          return Container(

            color: Color(0xFFD3EEF1),
             // Set the background color of the ListTile
            child: ListTile(

              title: Text(

                tasks[index].title,

                style: TextStyle(color: Colors.black), // Make the title colored black
              ),

              subtitle: Text(tasks[index].description),

              trailing: Checkbox(

                value: tasks[index].completed,

                onChanged: (value) {

                  setState(() {
                    tasks[index].completed = value!;
                  });
                },
              ),
            ),
          );
        },
      ),



      floatingActionButton: FloatingActionButton(


        onPressed: () {
          _showAddTaskDialog(context);
        },



        child: Icon(Icons.add),
      ),
    );
  }



  void _showAddTaskDialog(BuildContext context) {
    String title = '';
    String description = '';

    showDialog(

      context: context,

      builder: (BuildContext context) {

        return AlertDialog(

          title: Text('Add New Task'),

          content: Column(

            mainAxisSize: MainAxisSize.min,

            children: <Widget>[

              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                onChanged: (value) {
                  title = value;
                },
              ),



              TextField(
                decoration: InputDecoration(labelText: 'Description'),
                onChanged: (value) {
                  description = value;
                },
              ),



            ],
          ),


          actions: <Widget>[

            TextButton(

              child: Text('Add'),



              onPressed: () {
                setState(() {
                  tasks.add(Task(title: title, description: description, completed: false));
                });
                Navigator.of(context).pop();
              },

              
            ),
          ],
        );
      },
    );
  }
}

class Task {
  String title;
  String description;
  bool completed;

  Task({required this.title, required this.description, required this.completed});
}