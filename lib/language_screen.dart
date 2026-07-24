import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selectedLanguage = "English (US)";

  final List<String> _languages = [
    "English (US)",
    "English (UK)",
    "Spanish",
    "French",
    "German",
    "Chinese",
    "Japanese",
    "Hindi",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Language"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff6a11cb), Color(0xff2575fc)],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _languages.length,
        itemBuilder: (context, index) {
          final lang = _languages[index];
          return RadioListTile<String>(
            title: Text(lang),
            value: lang,
            groupValue: _selectedLanguage,
            onChanged: (value) {
              setState(() {
                _selectedLanguage = value!;
              });
              Get.snackbar("Language Updated", "Language changed to $_selectedLanguage");
            },
            activeColor: Colors.deepPurple,
          );
        },
      ),
    );
  }
}
