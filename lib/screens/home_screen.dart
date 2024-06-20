import 'package:flutter/material.dart';
import 'add_task_screen.dart';
import '../widgets/task_list.dart';
import '../models/task.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [
    Task(title: 'Completar proyecto Flutter', dueDate: DateTime.now()),
    Task(title: 'Ir al gimnasio', dueDate: DateTime.now().add(Duration(days: 1))),
    Task(title: 'Comprar alimentos', dueDate: DateTime.now().add(Duration(days: 2))),
  ];

  void _addTask(String title, DateTime dueDate) {
    setState(() {
      tasks.add(Task(title: title, dueDate: dueDate));
    });
  }

  void _toggleTaskCompletion(Task task, bool? isCompleted) {
    setState(() {
      task.isCompleted = isCompleted ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda'),
      ),
      body: TaskList(
        tasks: tasks,
        onTaskChanged: _toggleTaskCompletion,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
          if (result != null) {
            _addTask(result['title'], result['dueDate']);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
