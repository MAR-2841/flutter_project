import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

// Import Screens
import 'login_screen.dart';
import 'signup_screen.dart';
import 'home_screen.dart';
import 'settings_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';
import 'dashboard_screen.dart';
import 'help_support_screen.dart';
import 'about_screen.dart';
import 'analytics_screen.dart';
import 'task_screen.dart';
import 'calendar_screen.dart';

// Global state to track Firebase status
bool isFirebaseInitialized = false;

void main() async {
  // Ensure that plugin services are initialized before use
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    // Attempt to initialize Firebase
    await Firebase.initializeApp();
    isFirebaseInitialized = true;
    debugPrint("✅ Firebase initialized successfully");
  } catch (e) {
    // Graceful fallback if Firebase is not configured
    debugPrint("⚠️ Firebase initialization skipped: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lab 1 Pro App',
      debugShowCheckedModeBanner: false,
      
      // 🎨 Modern Material 3 Light Theme
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),

      // 🌙 Professional Dark Theme
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),

      // Automatically switch based on system settings
      themeMode: ThemeMode.system,
      
      // 🚀 Global Navigation Settings
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 400),

      initialRoute: '/login',
      
      getPages: [
        GetPage(name: '/login', page: () => const LogIn(), transition: Transition.fadeIn),
        GetPage(name: '/signup', page: () => const SignUp()),
        GetPage(name: '/home', page: () => const HomeScreen(), transition: Transition.rightToLeftWithFade),
        GetPage(name: '/settings', page: () => const SettingsScreen()),
        GetPage(name: '/notifications', page: () => const NotificationScreen(), transition: Transition.downToUp),
        GetPage(name: '/profile', page: () => const ProfileScreen()),
        GetPage(name: '/dashboard', page: () => const DashboardScreen()),
        GetPage(name: '/help', page: () => const HelpSupportScreen()),
        GetPage(name: '/about', page: () => const AboutScreen()),
        GetPage(name: '/analytics', page: () => const AnalyticsScreen()),
        GetPage(name: '/tasks', page: () => const TaskScreen()),
        GetPage(name: '/calendar', page: () => const CalendarScreen()),
      ],
    );
  }
}
