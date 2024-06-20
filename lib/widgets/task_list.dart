import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_item.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(Task, bool?) onTaskChanged;

  TaskList({required this.tasks, required this.onTaskChanged});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return TaskItem(
          task: tasks[index],
          onChanged: (bool? value) {
            onTaskChanged(tasks[index], value);
          },
        );
      },
    );
  }
}
