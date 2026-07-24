import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  bool _pushNotifications = true;
  bool _emailNotifications = false;
  bool _smsNotifications = true;
  bool _orderUpdates = true;
  bool _promotions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification Settings"),
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
          const _SettingsSection(title: "Channels"),
          _buildSwitchTile("Push Notifications", "Receive alerts on your device", _pushNotifications, (val) => setState(() => _pushNotifications = val)),
          _buildSwitchTile("Email Notifications", "Receive updates via email", _emailNotifications, (val) => setState(() => _emailNotifications = val)),
          _buildSwitchTile("SMS Notifications", "Receive text message alerts", _smsNotifications, (val) => setState(() => _smsNotifications = val)),
          const Divider(),
          const _SettingsSection(title: "Activities"),
          _buildSwitchTile("Order Updates", "Status of your current orders", _orderUpdates, (val) => setState(() => _orderUpdates = val)),
          _buildSwitchTile("Promotions", "New deals and special offers", _promotions, (val) => setState(() => _promotions = val)),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(String title, String subtitle, bool value, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.deepPurple,
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  const _SettingsSection({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.deepPurple.shade700, letterSpacing: 1.1),
      ),
    );
  }
}
