import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_task/database.dart';
import 'package:my_task/dialog_box.dart';
import 'package:my_task/tiles.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'listViewItems.dart';



/*
I have followed this video tutorial
to make this task page work and to store the tasks in Hive Database

     https://youtu.be/mMgr47QBZWA?si=LAZNDtGw_AzvqGfs
*/



class TasksPage extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String studentId;

  const TasksPage({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.studentId,
  }) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  bool taskCompleted = false;
  // Reference the Box
  final _myBox = Hive.box("mybox");

  final _controller = TextEditingController();
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // if it's the first time we open the app then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }



 //Check the status of the Check Box besides the task if it's check or not
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.myTasks[index][1] = !db.myTasks[index][1];
    });
    db.updateDataBase();
  }




  // Delete Task
  void deleteTask(int index) {
    setState(() {
      db.myTasks.removeAt(index);
    });
    db.updateDataBase();
  }




  // Save New Task
  void saveNewTask() {
    setState(() {
      db.myTasks.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateDataBase();
    Navigator.of(context).pop();
  }




  // Create New Task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Tasks Page", style: TextStyle(color: Colors.blue)),
        centerTitle: true,
        elevation: 10,
      ),


      //Button to add new Tasks
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white, size: 35.0),
      ),




      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: db.myTasks.length,
        itemBuilder: (BuildContext context, int index) {
          return TilesWidget(
            tileTitle: db.myTasks[index][0],
            taskState: db.myTasks[index][1],
            deleteFunction: (context) => deleteTask(index),
            onChanged: (value) {
              checkBoxChanged(value, index);
            },
          );
        },
      ),



      //Bottom Bar

      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [


              //Settings Page Button
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(
                        firstName: widget.firstName,
                        lastName: widget.lastName,
                        studentId: widget.studentId,
                      ),
                    ),
                  );
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Settings',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),





              //Task Home Button
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        firstName: widget.firstName,
                        lastName: widget.lastName,
                        studentId: widget.studentId,
                      ),
                    ),
                  );
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),





              //Task Page Button
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TasksPage(
                        firstName: widget.firstName,
                        lastName: widget.lastName,
                        studentId: widget.studentId,
                      ),
                    ),
                  );
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.task,
                      color: Colors.white,
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Tasks',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
