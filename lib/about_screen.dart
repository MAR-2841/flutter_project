import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About App"),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Icon(
                Icons.rocket_launch,
                size: 100,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Lab 1 Pro",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Version 1.0.0",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            const Text(
              "Lab 1 Pro is a comprehensive user management and productivity application designed to demonstrate modern Flutter development practices. It features offline-first capabilities with SQLite, cloud synchronization with Firebase Firestore, and a beautiful Material 3 interface.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 40),
            const Divider(),
            _buildInfoRow("Developer", "Expert AI Assistant"),
            _buildInfoRow("Framework", "Flutter"),
            _buildInfoRow("Language", "Dart"),
            _buildInfoRow("License", "MIT"),
            const SizedBox(height: 40),
            const Text(
              "© 2023 Lab 1 Pro Team",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(color: Colors.deepPurple)),
        ],
      ),
    );
  }
}
