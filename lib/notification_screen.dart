import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock notifications data
    final List<Map<String, String>> notifications = [
      {
        "title": "Welcome! 🎉",
        "body": "Thank you for joining our app. Explore the features now!",
        "time": "Just now"
      },
      {
        "title": "User Added",
        "body": "A new user has been successfully added to the database.",
        "time": "2 hours ago"
      },
      {
        "title": "Sync Successful",
        "body": "Your offline data has been synced with Firestore.",
        "time": "5 hours ago"
      },
      {
        "title": "Update Available",
        "body": "Version 1.0.1 is now available. Please update for new features.",
        "time": "yesterday"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xfff093fb), Color(0xfff5576c)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: notifications.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainValue.center,
                children: [
                  Icon(Icons.notifications_off_outlined, size: 80, color: Colors.grey),
                  SizedBox(height: 10),
                  Text("No notifications yet", style: TextStyle(color: Colors.grey)),
                ],
              ),
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final item = notifications[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.pinkAccent.withOpacity(0.2),
                      child: const Icon(Icons.notifications, color: Colors.pinkAccent),
                    ),
                    title: Text(
                      item["title"]!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(item["body"]!),
                        const SizedBox(height: 5),
                        Text(
                          item["time"]!,
                          style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
    );
  }
}
