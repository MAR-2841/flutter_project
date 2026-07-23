import 'package:flutter/material.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> docs = [
      {"name": "Project_Proposal.pdf", "size": "1.2 MB", "date": "Oct 10, 2023"},
      {"name": "Quarterly_Report.docx", "size": "850 KB", "date": "Oct 05, 2023"},
      {"name": "Team_Budget.xlsx", "size": "2.4 MB", "date": "Sep 28, 2023"},
      {"name": "Lab_Results.pdf", "size": "3.1 MB", "date": "Sep 20, 2023"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Document Vault"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff6a11cb), Color(0xff2575fc)],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: docs.length,
        itemBuilder: (context, index) {
          final doc = docs[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.description, color: Colors.blue, size: 30),
              title: Text(doc["name"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("${doc["size"]} • ${doc["date"]}"),
              trailing: const Icon(Icons.more_vert),
              onTap: () {},
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
