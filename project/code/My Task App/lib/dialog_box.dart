import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_task/my_button.dart';

class DialogBox extends StatelessWidget {
final controller;
VoidCallback onSave;
VoidCallback onCancel;

  DialogBox({super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade100,
      content: Container(
        height:200,
        width:400,
        child:
           Column(
              children: [
                //UserInput
                Text("Add New Task"),
                SizedBox(height:10),
                TextField(

                controller: controller,


                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Enter Your Task: ',
                    labelStyle: TextStyle(color: Colors.blue),
                  ),
                ),

                SizedBox(height:20),
                //Buttons Save and Cancel
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                    [

                      //Save Button
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyButton(text: "Save", onPressed: onSave,),
                      ),

                      //Cancel Button
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyButton(text: "Cancel", onPressed: onCancel),
                      ),
                    ]
                )

              ]

          )
      ),
    );
  }
}
