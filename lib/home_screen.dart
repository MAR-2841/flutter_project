import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff4facfe), Color(0xff00f2fe)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.home, size: 80, color: Colors.blue),
                  const SizedBox(height: 15),
                  const Text(
                    "Welcome Home 🎉",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "You are successfully logged in",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 25),
                  
                  // 📊 Dashboard Button
                  _buildMenuButton(
                    label: "Dashboard",
                    icon: Icons.dashboard_outlined,
                    gradient: const [Color(0xff6a11cb), Color(0xff2575fc)],
                    onTap: () => Get.toNamed('/dashboard'),
                  ),
                  const SizedBox(height: 15),
                  
                  // 👥 Manage Users Button
                  _buildMenuButton(
                    label: "Manage Users",
                    icon: Icons.people_outline,
                    gradient: const [Color(0xff11998e), Color(0xff38ef7d)],
                    onTap: () => Get.to(() => const UserListScreen()),
                  ),
                  const SizedBox(height: 15),

                  // 🔔 Notifications Button
                  _buildMenuButton(
                    label: "Notifications",
                    icon: Icons.notifications_none,
                    gradient: const [Color(0xfff093fb), Color(0xfff5576c)],
                    onTap: () => Get.toNamed('/notifications'),
                  ),
                  const SizedBox(height: 15),

                  // ⚙️ Settings Button
                  _buildMenuButton(
                    label: "Settings",
                    icon: Icons.settings_outlined,
                    gradient: const [Color(0xff434343), Color(0xff000000)],
                    onTap: () => Get.toNamed('/settings'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton({
    required String label,
    required IconData icon,
    required List<Color> gradient,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: onTap,
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: gradient),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white, size: 22),
                const SizedBox(width: 10),
                Text(
                  label,
                  style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
