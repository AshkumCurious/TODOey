import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
  List toDoList = [];

  //reference our box
  final myBox=Hive.box('mybox');

  //runs when the app is opened for the first time
  void createInitialData(){
    toDoList = [];
  }

  //load data from database
  void loadData(){
    toDoList= myBox.get("TODOLIST");
  }
  //update the databse
  void updateData(){
    myBox.put("TODOLIST", toDoList);
  }
}