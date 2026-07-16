import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

// Screens
import 'login_screen.dart';
import 'signup_screen.dart';
import 'home_screen.dart';
import 'settings_screen.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';

// Global flag to check if firebase is ready
bool isFirebaseInitialized = false;

void main() async {
  // Ensure Flutter bindings are initialized before any async calls
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    // Initialize Firebase (will fail gracefully if options are missing)
    await Firebase.initializeApp();
    isFirebaseInitialized = true;
  } catch (e) {
    debugPrint("Firebase initialization skipped or failed: $e");
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
      
      // 🎨 Improved Light Theme
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

      // 🌙 Improved Dark Theme
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),

      // Sync with System Theme
      themeMode: ThemeMode.system,
      
      // 🚀 Global Navigation Settings
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 400),

      initialRoute: '/login',
      
      getPages: [
        GetPage(
          name: '/login', 
          page: () => const LogIn(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: '/signup', 
          page: () => const SignUp(),
        ),
        GetPage(
          name: '/home', 
          page: () => const HomeScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: '/settings', 
          page: () => const SettingsScreen(),
        ),
        GetPage(
          name: '/notifications', 
          page: () => const NotificationScreen(),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: '/profile', 
          page: () => const ProfileScreen(),
        ),
      ],
    );
  }
}
