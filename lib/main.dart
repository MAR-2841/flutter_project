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
    // Graceful fallback if Firebase is not configured (e.g., missing google-services.json)
    debugPrint("⚠️ Firebase initialization skipped: $e");
    debugPrint("The app will run in Offline Mode (SQLite only).");
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
          backgroundColor: Colors.transparent,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
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
      
      // 🚀 Advanced Navigation Settings
      defaultTransition: Transition.cupertino, // Smooth native transitions
      transitionDuration: const Duration(milliseconds: 500),

      initialRoute: '/login',
      
      getPages: [
        GetPage(
          name: '/login', 
          page: () => const LogIn(),
          transition: Transition.fadeIn, // Smooth entry for auth
        ),
        GetPage(
          name: '/signup', 
          page: () => const SignUp(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: '/home', 
          page: () => const HomeScreen(),
          transition: Transition.zoom, // Dynamic entry for home
        ),
        GetPage(
          name: '/settings', 
          page: () => const SettingsScreen(),
          transition: Transition.native,
        ),
        GetPage(
          name: '/notifications', 
          page: () => const NotificationScreen(),
          transition: Transition.downToUp, // Traditional notification slide
        ),
        GetPage(
          name: '/profile', 
          page: () => const ProfileScreen(),
          transition: Transition.circularReveal, // Stylish entry for profile
        ),
      ],
    );
  }
}
