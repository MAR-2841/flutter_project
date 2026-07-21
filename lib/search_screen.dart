import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _allUsers = [
    "Alice Johnson", "Bob Smith", "Charlie Brown", "David Miller", 
    "Eve Wilson", "Frank Wright", "Grace Hopper", "Henry Ford"
  ];
  List<String> _filteredUsers = [];

  @override
  void initState() {
    super.initState();
    _filteredUsers = _allUsers;
  }

  void _filterSearch(String query) {
    setState(() {
      _filteredUsers = _allUsers
          .where((user) => user.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: "Search users...",
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
          onChanged: _filterSearch,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff6a11cb), Color(0xff2575fc)],
            ),
          ),
        ),
      ),
      body: _filteredUsers.isEmpty
          ? const Center(child: Text("No results found"))
          : ListView.builder(
              itemCount: _filteredUsers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(_filteredUsers[index]),
                  onTap: () {},
                );
              },
            ),
    );
  }
}
