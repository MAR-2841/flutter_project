import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> news = [
      {
        "title": "Flutter 4.0 Released",
        "description": "Google announces major updates to the Flutter framework.",
        "image": "https://picsum.photos/100/100?random=20"
      },
      {
        "title": "Tech Trends 2024",
        "description": "What to expect in the world of technology next year.",
        "image": "https://picsum.photos/100/100?random=21"
      },
      {
        "title": "Dart is growing fast",
        "description": "The language behind Flutter is seeing massive adoption.",
        "image": "https://picsum.photos/100/100?random=22"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Latest News"),
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
        itemCount: news.length,
        itemBuilder: (context, index) {
          final item = news[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(item["image"]!, width: 60, height: 60, fit: BoxFit.cover),
              ),
              title: Text(item["title"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(item["description"]!),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
