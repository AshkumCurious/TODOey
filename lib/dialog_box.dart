import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todoey/my_button.dart';
class DialogBox extends StatelessWidget {
  final taskcontroller;
  final descontroller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({required this.taskcontroller,required this.descontroller,required this.onSave,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple.shade100,
       content: Container(
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(100.0),
         ),
         height: 310.0,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Text('New Task',
             style: TextStyle(
               color: Colors.deepPurple,
               fontSize: 20.0,
             ),),
             SizedBox(
               height: 20.0,
             ),
           TextField(
             controller: taskcontroller,
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               hintText: "Add a new task",
             ),
           ),

             SizedBox(
               height: 13.0,
             ),
             TextField(
               controller: descontroller,
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 hintText: "Add description",
               ),
             ),
            SizedBox(
              height: 78.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(text: "CANCEL", onPressed: onCancel),
                //cancel button
                SizedBox(
                  width: 8.0,
                ),
                MyButton(text: "SAVE", onPressed: onSave),
              ],
            ),
         ],
         ),
       ),
    );
  }
}
