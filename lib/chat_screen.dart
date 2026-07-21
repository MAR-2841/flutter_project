import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> chats = [
      {"name": "Alice Johnson", "message": "Hey, how is the project going?", "time": "10:30 AM"},
      {"name": "Bob Smith", "message": "I uploaded the new designs.", "time": "Yesterday"},
      {"name": "Charlie Brown", "message": "Meeting at 3 PM today.", "time": "Monday"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
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
      body: ListView.separated(
        itemCount: chats.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepPurple.shade100,
              child: Text(chat["name"]![0], style: const TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold)),
            ),
            title: Text(chat["name"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(chat["message"]!, maxLines: 1, overflow: TextOverflow.ellipsis),
            trailing: Text(chat["time"]!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            onTap: () {
              // Open chat detail
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.message, color: Colors.white),
      ),
    );
  }
}
