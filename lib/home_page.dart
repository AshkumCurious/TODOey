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
  final taskcontroller = TextEditingController();
  final descontroller = TextEditingController();


  void checkBoxChanged(bool? value, int index)
  {
    setState(() {
      db.toDoList[index][2] = !db.toDoList[index][2];
    });
    db.updateData();
  }

  void saveNewTask(){

    setState(() {
      final now = DateTime.parse(DateTime.now().toString());
      String tdnow = now.day.toString()+"-"+now.month.toString()+"-"+now.year.toString()+"  "+now.hour.toString() + ":" + now.minute.toString();
      db.toDoList.add([taskcontroller.text,descontroller.text,false,tdnow,]);
      taskcontroller.clear();
      descontroller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void createNewTask(){
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            taskcontroller: taskcontroller,
            descontroller: descontroller,
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

  int completeTask()
  {
    int c=0;
    for(int i=0;i<db.toDoList.length;i++)
      {
        if(db.toDoList[i][2]==true)
          c++;
      }
    return c;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.5, 0.7, 0.4, 0.3],
          colors: [
            Colors.grey.shade900,
            Colors.grey.shade900,
            Colors.grey.shade800,
            Colors.grey.shade800,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Color(0x00000000),
        appBar: AppBar(
            title: Text('TO DO '),
        ),
        endDrawer: Drawer(
          backgroundColor: Colors.deepPurple.shade100,
           child: Column(
           //  crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Container(
                 height: 330.0,
                 width: double.infinity,
                 color: Colors.deepPurple,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                   children: [
                     Icon(Icons.person,
                     size: 250.0,
                     ),
                     Text(" Hello!",
                     style: TextStyle(
                       fontSize: 35.0,
                       fontWeight: FontWeight.bold,
                     ),
                     ),
                     Text("  User",
                       style: TextStyle(
                         fontSize: 20.0,
                        // fontWeight: FontWeight.bold,
                       ),
                     ),
                   ],
                 ),
               ),
               SizedBox(
                 height: 40.0,
               ),
               Text("Total Tasks: "+db.toDoList.length.toString(),
               style: TextStyle(
                 fontSize: 25.0,
                 fontWeight: FontWeight.w500,

               ),
               ),
               SizedBox(
                 height: 10.0,
               ),
               Text("Tasks Completed: " + completeTask().toString(),
                 style: TextStyle(
                   fontSize: 25.0,
                   fontWeight: FontWeight.w500,
                 ),
               ),
               SizedBox(
                 height: 10.0,
               ),
               Text("Tasks Pending: " + (db.toDoList.length-completeTask()).toString(),
                 style: TextStyle(
                   fontSize: 25.0,
                   fontWeight: FontWeight.w500,
                 ),
               ),
             ],

           ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: createNewTask,
          child: Icon(Icons.add,),
        ),
        body: ListView.builder(
            itemCount: db.toDoList.length,
            itemBuilder: (context,index)
            {
              return ToDoTile(
                  taskName: db.toDoList[index][0],
                  des: db.toDoList[index][1],
                  taskCompleted: db.toDoList[index][2],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunction: (context) => deleteTask(index),
                  datetime:db.toDoList[index][3],
              );
            },
          ),
        ),
    );
  }
}
