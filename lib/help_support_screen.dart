import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help & Support"),
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSupportItem(
            context,
            Icons.question_answer_outlined,
            "FAQs",
            "Find answers to frequently asked questions.",
            () => Get.toNamed('/faq'),
          ),
          _buildSupportItem(
            context,
            Icons.contact_support_outlined,
            "Contact Us",
            "Get in touch with our support team.",
            () => Get.toNamed('/contact_us'),
          ),
          _buildSupportItem(
            context,
            Icons.bug_report_outlined,
            "Report a Bug",
            "Help us improve by reporting issues.",
            () => Get.toNamed('/report_bug'),
          ),
          _buildSupportItem(
            context,
            Icons.feedback_outlined,
            "Send Feedback",
            "Share your thoughts on how we can improve.",
            () => Get.toNamed('/feedback'),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportItem(BuildContext context, IconData icon, String title, String subtitle, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
