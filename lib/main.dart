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
import 'profile_edit_screen.dart';
import 'dashboard_screen.dart';
import 'analytics_screen.dart';
import 'task_screen.dart';
import 'calendar_screen.dart';
import 'help_support_screen.dart';
import 'about_screen.dart';
import 'chat_screen.dart';
import 'search_screen.dart';
import 'gallery_screen.dart';
import 'wallet_screen.dart';
import 'notes_screen.dart';
import 'contacts_screen.dart';
import 'news_screen.dart';
import 'weather_screen.dart';
import 'privacy_policy_screen.dart';
import 'feedback_screen.dart';
import 'faq_screen.dart';

// Global flag to check if firebase is ready
bool isFirebaseInitialized = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    isFirebaseInitialized = true;
    debugPrint("Firebase initialized successfully");
  } catch (e) {
    debugPrint("Firebase initialization skipped: $e");
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
      themeMode: ThemeMode.system,
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
        GetPage(name: '/profile_edit', page: () => const ProfileEditScreen()),
        GetPage(name: '/dashboard', page: () => const DashboardScreen()),
        GetPage(name: '/analytics', page: () => const AnalyticsScreen()),
        GetPage(name: '/tasks', page: () => const TaskScreen()),
        GetPage(name: '/calendar', page: () => const CalendarScreen()),
        GetPage(name: '/help', page: () => const HelpSupportScreen()),
        GetPage(name: '/about', page: () => const AboutScreen()),
        GetPage(name: '/chats', page: () => const ChatScreen()),
        GetPage(name: '/search', page: () => const SearchScreen()),
        GetPage(name: '/gallery', page: () => const GalleryScreen()),
        GetPage(name: '/wallet', page: () => const WalletScreen()),
        GetPage(name: '/notes', page: () => const NotesScreen()),
        GetPage(name: '/contacts', page: () => const ContactsScreen()),
        GetPage(name: '/news', page: () => const NewsScreen()),
        GetPage(name: '/weather', page: () => const WeatherScreen()),
        GetPage(name: '/privacy', page: () => const PrivacyPolicyScreen()),
        GetPage(name: '/feedback', page: () => const FeedbackScreen()),
        GetPage(name: '/faq', page: () => const FAQScreen()),
      ],
    );
  }
}
