import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app_2/features/auth/presentation/widgets/TaskItem.dart';
import 'package:to_do_app_2/features/auth/presentation/widgets/batton_add_task.dart';

class HomeScrean extends StatefulWidget {
  const HomeScrean({super.key});

  @override
  State<HomeScrean> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScrean> {
  List<Map<String, dynamic>> tasks = [];

  void addTask(String task) {
    setState(() {
      tasks.add({
        "task": task,
        "time": DateFormat('hh:mm a').format(DateTime.now()),
        "completed": false,
      });
    });
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 50),

            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 30,
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  "lib/images/unsplash_yMSecCHsIBc.png",
                ),
                radius: 28,
              ),
            ),

            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Tody",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Text(
              "Hide completed",
              style: TextStyle(
                color: Color(0XFF3478F6),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskItem(
                    onEdit: (newTask) {
                      // ✅ تحديث المهمة
                      setState(() {
                        tasks[index]["task"] = newTask;
                      });
                    },
                    onRemove: () => removeTask(index),
                    task: tasks[index]["task"],
                    time: tasks[index]["time"],
                    initialCompleted: tasks[index]["completed"],
                    onChanged: (value) {
                      setState(() {
                        tasks[index]["completed"] = value;
                      });
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 16),
            BattonAddTask(onTaskAdded: addTask),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
