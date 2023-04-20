import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {


  final String taskName;
  final String des;
  final bool taskCompleted;
  String datetime;
  Function(bool?)?onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({required this.taskName,required this.des,required this.taskCompleted,required this.onChanged, required this.deleteFunction, required this.datetime});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,top:12.0,right: 25.0,bottom: 0.0),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: deleteFunction,
              icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
            ]),
        child: Container(
          padding: EdgeInsets.all(24.0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
              children:[
              Checkbox(
                  value:taskCompleted ,
                  onChanged: onChanged,
                 activeColor: Colors.black,

              ),
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 25.0,
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
        ],
        ),
              Text(des, overflow: TextOverflow.ellipsis,),
              SizedBox(height: 5.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            elevation: 100.0,
                            backgroundColor: Colors.deepPurple.shade200,
                            title: Text(taskName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,

                            ),
                            ),
                            content: Text(des),
                          );
                        },
                      );
                    },
                    child: Text("show more...",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.deepPurple,
                    ),),
                  ),
                  Text( datetime,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8.0
                  ),),
                ],
              )
            ],
          ),
          decoration: BoxDecoration(color: Colors.deepPurple.shade200,
          borderRadius: BorderRadius.circular(12.0)
          ),
        ),
      ),
    );
  }
}
