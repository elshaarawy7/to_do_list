import 'package:flutter/material.dart';

class BattonAddTask extends StatelessWidget {
  final Function(String) onTaskAdded; // دالة لاستقبال المهمة

  const BattonAddTask({super.key, required this.onTaskAdded});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showAddTaskDialog(context), // عند الضغط افتح النافذة
      backgroundColor: Colors.black,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }

  // نافذة إدخال المهمة
  void _showAddTaskDialog(BuildContext context) {
    String newTask = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Add Task',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: TextField(
            onChanged: (value) => newTask = value,
            decoration: InputDecoration(
              labelText: 'Task Title',
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.black),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
          actions: [
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                if (newTask.isNotEmpty) {
                  onTaskAdded(newTask); // نضيف المهمة في القائمة
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
