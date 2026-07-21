import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> contacts = [
      {"name": "Alice Johnson", "phone": "+1 555-0101", "initial": "A"},
      {"name": "Bob Smith", "phone": "+1 555-0102", "initial": "B"},
      {"name": "Charlie Brown", "phone": "+1 555-0103", "initial": "C"},
      {"name": "David Miller", "phone": "+1 555-0104", "initial": "D"},
      {"name": "Eve Wilson", "phone": "+1 555-0105", "initial": "E"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff6a11cb), Color(0xff2575fc)],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Text(contact["initial"]!, style: const TextStyle(color: Colors.white)),
            ),
            title: Text(contact["name"]!),
            subtitle: Text(contact["phone"]!),
            trailing: const Icon(Icons.call, color: Colors.green),
            onTap: () {},
          );
        },
      ),
    );
  }
}
