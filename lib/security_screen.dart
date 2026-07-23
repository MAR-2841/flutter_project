import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Security"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff6a11cb), Color(0xff2575fc)],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSecurityTile(
            Icons.fingerprint,
            "Biometric Authentication",
            "Use fingerprint or face ID to login",
            true,
          ),
          _buildSecurityTile(
            Icons.vibration,
            "Two-Factor Authentication",
            "Add an extra layer of security",
            false,
          ),
          _buildSecurityTile(
            Icons.devices,
            "Trusted Devices",
            "Manage devices that can access your account",
            null,
          ),
          _buildSecurityTile(
            Icons.history,
            "Login History",
            "Check recent login activity",
            null,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            ),
            onPressed: () {
              Get.snackbar("Security", "Logging out from all devices...");
            },
            child: const Text("Logout from all devices"),
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityTile(IconData icon, String title, String subtitle, bool? value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: value == null
            ? const Icon(Icons.arrow_forward_ios, size: 16)
            : Switch(value: value, onChanged: (val) {}),
      ),
    );
  }
}
