import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import 'home_screen.dart';

// Global flag to check if firebase is ready
bool isFirebaseInitialized = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    // This will fail if firebase_options.dart is missing or config is wrong
    await Firebase.initializeApp();
    isFirebaseInitialized = true;
  } catch (e) {
    print("Firebase initialization skipped: $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Auth Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => const LogIn()),
        GetPage(name: '/signup', page: () => const SignUp()),
        GetPage(name: '/home', page: () => const HomeScreen()),
      ],
    );
  }
}
