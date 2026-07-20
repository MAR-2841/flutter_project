import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final List<Map<String, dynamic>> _tasks = [
    {"title": "Complete Lab 1 Report", "isDone": false},
    {"title": "Setup Firebase Firestore", "isDone": true},
    {"title": "Implement SQLite local storage", "isDone": true},
    {"title": "Design Settings UI", "isDone": false},
  ];

  void _toggleTask(int index) {
    setState(() {
      _tasks[index]["isDone"] = !_tasks[index]["isDone"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Tasks"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff6a11cb), Color(0xff2575fc)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: CheckboxListTile(
              title: Text(
                task["title"],
                style: TextStyle(
                  decoration: task["isDone"] ? TextDecoration.lineThrough : null,
                  color: task["isDone"] ? Colors.grey : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              value: task["isDone"],
              onChanged: (val) => _toggleTask(index),
              activeColor: Colors.deepPurple,
              controlAffinity: ListTileControlAffinity.leading,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add logic
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
