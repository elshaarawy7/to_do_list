import 'package:flutter/material.dart';
import 'package:to_do_app_2/features/auth/presentation/widgets/batton_add_task.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<AddTask> {
  List<String> tasks = []; // 📝 قائمة تخزين المهام

  void addTask(String task) {
    setState(() {
      tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo App')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]),
          );
        },
      ),
      floatingActionButton: BattonAddTask(onTaskAdded: addTask), 
    );
  }
}