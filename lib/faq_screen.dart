import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqs = [
      {
        "question": "How do I reset my password?",
        "answer": "Go to the profile screen and click on 'Edit Profile'. We are working on a dedicated 'Forgot Password' feature."
      },
      {
        "question": "Is my data synced automatically?",
        "answer": "Yes, if you are online, your data syncs with Firestore. If offline, it stays in your local SQLite database and can be synced later."
      },
      {
        "question": "How can I enable Dark Mode?",
        "answer": "Navigate to Settings and toggle the 'Dark Mode' switch."
      },
      {
        "question": "Can I use the app offline?",
        "answer": "Absolutely! The app is designed to work offline using a local database."
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("FAQ"),
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
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              faqs[index]["question"]!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(faqs[index]["answer"]!),
              ),
            ],
          );
        },
      ),
    );
  }
}
