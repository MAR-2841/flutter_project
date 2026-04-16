import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static List<Map<String, String>> users = [];

  // Load users from storage
  static Future<void> loadUsers() async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString("users");

    if (data != null) {
      List decoded = jsonDecode(data);
      users = decoded.map((e) => Map<String, String>.from(e)).toList();
    }
  }

  // Save users to storage
  static Future<void> saveUsers() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("users", jsonEncode(users));
  }

  static bool isValidEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  // SIGN UP
  static Future<String> signUp(
      String email, String password, String confirmPassword) async {
    await loadUsers();

    email = email.trim();
    password = password.trim();
    confirmPassword = confirmPassword.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      return "All fields are required";
    }

    if (!isValidEmail(email)) {
      return "Invalid email format";
    }

    if (password.length < 6) {
      return "Password must be at least 6 characters";
    }

    if (password != confirmPassword) {
      return "Passwords do not match";
    }

    for (var user in users) {
      if (user["email"] == email) {
        return "User already exists";
      }
    }

    users.add({
      "email": email,
      "password": password,
    });

    await saveUsers();

    return "Sign up successful";
  }

  // LOGIN
  static Future<String> login(String email, String password) async {
    await loadUsers();

    email = email.trim();
    password = password.trim();

    for (var user in users) {
      if (user["email"] == email) {
        if (user["password"] == password) {
          return "Login successful";
        } else {
          return "Wrong password";
        }
      }
    }

    return "User not found";
  }
}
