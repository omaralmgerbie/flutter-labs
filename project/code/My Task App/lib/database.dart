import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {

  //Refrence the Bix
  final _myBox= Hive.box("mybox");

  List myTasks = [];

  List students = [
    [],
    [],
  ];

  // This Method will run if we open the app for the first time ever
  void createInitialData()
  {
    myTasks = [
      ["📖 Read Quran ", false],
      ["🏃‍♂ Do Exercise️s", false],
    ];
  }

  //Load Data From DataBase
void loadData()
{
  myTasks = _myBox.get("TODOLIST");
}

  // Update Database
void updateDataBase()
{
  _myBox.put("TODOLIST", myTasks);
}


}