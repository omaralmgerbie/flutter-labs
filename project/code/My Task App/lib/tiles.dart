import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TilesWidget extends StatelessWidget {
   final String tileTitle;
   final bool taskState;
   Function(bool?)? onChanged;
   Function(BuildContext)? deleteFunction;

   TilesWidget({
    required this.tileTitle,
    required this.taskState,
    required this.onChanged,
     required this.deleteFunction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children:[
            SlidableAction(onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade400,
              borderRadius: BorderRadius.circular(12),


            ),


          ]
        ),
        child: Container(

        margin: const EdgeInsets.only(bottom: 16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),

      child:
      ListTile(
        leading: Checkbox(value: taskState, onChanged: onChanged, activeColor:Colors.black),
        title: Text(tileTitle, style:TextStyle(decoration: taskState ? TextDecoration.lineThrough : TextDecoration.none)),



      )

    )
    );
  }
}
