class User {
  int? id;
  final String name;
  final String email;
  bool isSynced;

  User({
    this.id,
    required this.name,
    required this.email,
    this.isSynced = true,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'isSynced': isSynced ? 1 : 0,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int?,
      name: map['name'] as String,
      email: map['email'] as String,
      isSynced: map['isSynced'] == 1,
    );
  }
}
