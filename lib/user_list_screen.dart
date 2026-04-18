import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_model.dart';
import 'user_repository.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final UserRepository repo = UserRepository();
  List<User> users = [];
  bool isLoading = true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _loadUsers() async {
    setState(() => isLoading = true);
    final data = await repo.getUsers();
    setState(() {
      users = data;
      isLoading = false;
    });
  }

  Future<void> _addUser() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();

    if (name.isNotEmpty && email.isNotEmpty) {
      await repo.addUser(User(name: name, email: email));
      _nameController.clear();
      _emailController.clear();
      _loadUsers();
    }
  }

  Future<void> _updateUser(User user, String newName, String newEmail) async {
    if (newName.isNotEmpty && newEmail.isNotEmpty) {
      await repo.updateUser(User(id: user.id, name: newName, email: newEmail));
      _loadUsers();
    }
  }

  void _showUserDialog({User? user}) {
    if (user != null) {
      _nameController.text = user.name;
      _emailController.text = user.email;
    } else {
      _nameController.clear();
      _emailController.clear();
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(user == null ? "Add User" : "Update User"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              if (user == null) {
                await _addUser();
              } else {
                await _updateUser(user, _nameController.text, _emailController.text);
              }
              if (mounted) Navigator.pop(context);
            },
            child: Text(user == null ? "Save" : "Update"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Management"),
        actions: [
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: () async {
              await repo.syncUsers();
              _loadUsers();
              Get.snackbar("Sync", "Offline users synced to Firestore");
            },
          )
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : users.isEmpty
              ? const Center(child: Text("No users found"))
              : ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: user.isSynced ? Colors.green : Colors.orange,
                          child: Icon(
                            user.isSynced ? Icons.cloud_done : Icons.cloud_off,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        title: Text(user.name),
                        subtitle: Text(user.email),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () => _showUserDialog(user: user),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () async {
                                await repo.deleteUser(user);
                                _loadUsers();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showUserDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
