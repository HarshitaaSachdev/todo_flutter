import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
    this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,right:25.0,top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children:[
            SlidableAction(
              onPressed: deleteFunction,
              icon: CupertinoIcons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.deepPurple[300],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              //chckbox
               Checkbox(value: taskCompleted,onChanged: onChanged,
               activeColor: Colors.black,
               ),
        
              //Task name
              Text(taskName,
              style: TextStyle(
        
                decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                decorationThickness: 2.5,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
