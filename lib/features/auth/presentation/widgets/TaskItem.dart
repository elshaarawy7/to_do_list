import 'package:flutter/material.dart';

class TaskItem extends StatefulWidget {
  final String task;
  final String time;
  final bool initialCompleted;
  final Function(bool?) onChanged;
  final VoidCallback onRemove;
  final Function(String) onEdit; // ✅ دالة التعديل

  const TaskItem({
    super.key,
    required this.task,
    required this.time,
    required this.initialCompleted,
    required this.onChanged,
    required this.onRemove,
    required this.onEdit, // ✅ استلام دالة التعديل
  });

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  late bool completed;

  @override
  void initState() {
    super.initState();
    completed = widget.initialCompleted;
  }

  // ✅ نافذة تعديل المهمة
  void _showEditDialog(BuildContext context) {
    TextEditingController controller = TextEditingController(text: widget.task);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Task",style: TextStyle(
            color: Colors.black , 
            fontSize: 20 , 
            fontWeight: FontWeight.bold ,
          ), ),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: "Task Title",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
          actions: [
            TextButton(
              style:ButtonStyle(  
                 backgroundColor: MaterialStateProperty.all(Colors.red),
              ) ,
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel" , style: TextStyle(
                color: Colors.white , 
                fontSize: 18 , 
                fontWeight: FontWeight.w500 , 
              ),),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green , 
                ),
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  widget.onEdit(controller.text); // ✅ تحديث المهمة
                  Navigator.pop(context);
                }
              },
              child: const Text("Save" , style: TextStyle(
                color: Colors.white , 
                fontSize: 18 , 
                fontWeight: FontWeight.w500 , 
              ),),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: Checkbox(
            value: completed,
            activeColor: Colors.black,
            checkColor: Colors.white,
            onChanged: (value) {
              setState(() {
                completed = value!;
              });
              widget.onChanged(value);
            },
          ),
          title: Text(
            widget.task,
            style: TextStyle(
              decoration: completed ? TextDecoration.lineThrough : null,
              color: completed ? Colors.grey : Colors.black,
            ),
          ),
          subtitle: Text(widget.time.isNotEmpty ? widget.time : "No time"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ✅ زر التعديل
              IconButton(
                onPressed: () => _showEditDialog(context),
                icon: const Icon(Icons.edit, size: 20),
              ),
              // زر الحذف
              IconButton(
                onPressed: widget.onRemove,
                icon: const Icon(Icons.delete, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

