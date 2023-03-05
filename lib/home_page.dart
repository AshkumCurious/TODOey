import 'package:flutter/material.dart';
import 'package:todoey/dialog_box.dart';
import 'package:todoey/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoey/databse/database.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //reference the hive box
  final myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState(){

    //if app is opened for the first time
    if(myBox.get("TODOLIST")==null) {
      db.createInitialData();
    }
    else
      db.loadData();

  }

  //text controller
  final controller = TextEditingController();


  void checkBoxChanged(bool? value, int index)
  {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void saveNewTask(){
    setState(() {
      db.toDoList.add([controller.text,false]);
      controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewTask(){
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        },
    );
  }

  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Center(
            child: Text('TO DO         '),
          ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
        child: Icon(Icons.add,),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('lib/images/TODOEYlogo.png'),
          fit: BoxFit.contain,
          )
        ),
        child: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context,index)
          {
            return ToDoTile(
                taskName: db.toDoList[index][0],
                taskCompleted: db.toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },

        ),
      )
    );
  }
}
