import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteAction;

  ToDoTile(
      {super.key,
      required this.onChanged,
      required this.taskCompleted,
      required this.taskName,
      required this.deleteAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 22),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(24),
              onPressed: deleteAction,
              icon: Icons.delete_sweep,
              backgroundColor: const Color.fromARGB(255, 199, 39, 39),
              foregroundColor: Colors.white,
              label: "D E L E T E",
              spacing: 2,
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(27.5),
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(24)),
          child: Row(
            children: [
              // checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: const Color.fromARGB(255, 17, 132, 22),
              ),

              // task name
              Text(
                taskName,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
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
