import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChangedValue;
  Function(BuildContext)? deleteTask;
  ToDoList(
      {required this.taskName,
      required this.taskCompleted,
      required this.onChangedValue,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteTask,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChangedValue,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
