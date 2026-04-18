import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'user_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
        isSynced INTEGER DEFAULT 1
      )
    ''');
  }

  Future<int> insertUser(User user, {bool synced = true}) async {
    final db = await instance.database;
    return await db.insert('users', {
      'name': user.name,
      'email': user.email,
      'isSynced': synced ? 1 : 0,
    });
  }

  Future<int> updateUser(User user) async {
    final db = await instance.database;
    return await db.update(
      'users',
      {'name': user.name, 'email': user.email, 'isSynced': user.isSynced ? 1 : 0},
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async {
    final db = await instance.database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<User>> fetchUsers() async {
    final db = await instance.database;
    final result = await db.query('users');
    return result.map((json) => User.fromMap(json)).toList();
  }

  Future<List<User>> fetchUnsyncedUsers() async {
    final db = await instance.database;
    final result = await db.query('users', where: 'isSynced = ?', whereArgs: [0]);
    return result.map((json) => User.fromMap(json)).toList();
  }

  Future<int> markAsSynced(int id) async {
    final db = await instance.database;
    return await db.update('users', {'isSynced': 1}, where: 'id = ?', whereArgs: [id]);
  }
}
