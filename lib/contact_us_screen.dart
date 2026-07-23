import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff6a11cb), Color(0xff2575fc)],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.support_agent, size: 80, color: Colors.deepPurple),
            const SizedBox(height: 20),
            const Text(
              "How can we help you?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Our team is here to assist you with any questions or issues.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            _buildContactCard(
              Icons.email,
              "Email Us",
              "support@lab1pro.com",
              () => Get.snackbar("Email", "Opening email client..."),
            ),
            const SizedBox(height: 15),
            _buildContactCard(
              Icons.phone,
              "Call Us",
              "+1 234 567 890",
              () => Get.snackbar("Phone", "Opening dialer..."),
            ),
            const SizedBox(height: 15),
            _buildContactCard(
              Icons.location_on,
              "Visit Us",
              "123 Tech Avenue, Silicon Valley, CA",
              () => Get.snackbar("Map", "Opening maps..."),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(IconData icon, String title, String detail, VoidCallback onTap) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(detail),
        onTap: onTap,
      ),
    );
  }
}
