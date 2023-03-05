import 'package:flutter/material.dart';
import 'package:todoey/my_button.dart';
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({required this.controller,required this.onSave,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
       content: Container(
         height: 120.0,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
           TextField(
             controller: controller,
             decoration: InputDecoration(
               border: OutlineInputBorder(),
               hintText: "Add a new task",
             ),
           ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //save button
                MyButton(text: "SAVE", onPressed: onSave),
                //cancel button
                MyButton(text: "CANCEL", onPressed: onCancel),
              ],
            ),
         ],
         ),
       ),
    );
  }
}
