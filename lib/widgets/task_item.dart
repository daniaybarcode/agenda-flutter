import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final ValueChanged<bool?> onChanged;

  TaskItem({required this.task, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(task.dueDate);

    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(task.title),
          Text(
            'Fecha: $formattedDate',
            style: TextStyle(fontSize: 12),
          ),
          if (task.isCompleted)
            Text(
              'Completada',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
        ],
      ),
      trailing: Checkbox(
        value: task.isCompleted,
        onChanged: onChanged,
      ),
    );
  }
}
