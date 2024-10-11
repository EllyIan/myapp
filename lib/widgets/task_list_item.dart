import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskListItem extends StatelessWidget {
  final Task task;
  final Function(bool) onTaskCompleted;

  const TaskListItem({
    Key? key,
    required this.task,
    required this.onTaskCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.completed ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(task.description),
      leading: Checkbox(
        value: task.completed,
        onChanged: (bool? value) {
          if (value != null) {
            onTaskCompleted(value);
          }
        },
      ),
      trailing: IconButton(
        icon: Icon(Icons.more_vert),
        onPressed: () {
          // TODO: Implement task options (edit, delete, etc.)
        },
      ),
    );
  }
}