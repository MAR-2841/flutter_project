import 'package:connectivity_plus/connectivity_plus.dart';
import 'database_helper.dart';
import 'firestore_service.dart';
import 'user_model.dart';
import 'main.dart'; // Import to check isFirebaseInitialized

class UserRepository {
  // Use lazy initialization or check flag before use
  final FirestoreService _firestoreService = FirestoreService();
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  Future<bool> isOnline() async {
    // Only return true if both internet is available AND Firebase is initialized
    if (!isFirebaseInitialized) return false;
    
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  Future<List<User>> getUsers() async {
    // Always use local DB as the primary source to avoid crashes
    return _dbHelper.fetchUsers();
  }

  Future<void> addUser(User user) async {
    bool online = await isOnline();
    if (online) {
      try {
        await _firestoreService.addUser(user);
        await _dbHelper.insertUser(user, synced: true);
        return;
      } catch (e) {
        print("Firestore add failed, saving locally: $e");
      }
    }
    // Fallback to local
    await _dbHelper.insertUser(user, synced: false);
  }

  Future<void> updateUser(User user) async {
    bool online = await isOnline();
    if (online) {
      try {
        String? docId = await _firestoreService.getDocIdByEmail(user.email);
        if (docId != null) {
          await _firestoreService.updateUser(docId, user);
          user.isSynced = true;
          await _dbHelper.updateUser(user);
          return;
        }
      } catch (e) {
        print("Firestore update failed: $e");
      }
    }
    user.isSynced = false;
    await _dbHelper.updateUser(user);
  }

  Future<void> deleteUser(User user) async {
    bool online = await isOnline();
    if (online) {
      try {
        String? docId = await _firestoreService.getDocIdByEmail(user.email);
        if (docId != null) {
          await _firestoreService.deleteUser(docId);
        }
      } catch (e) {
        print("Firestore delete failed: $e");
      }
    }
    await _dbHelper.deleteUser(user.id!);
  }

  Future<void> syncUsers() async {
    if (await isOnline()) {
      try {
        final unsynced = await _dbHelper.fetchUnsyncedUsers();
        for (var user in unsynced) {
          await _firestoreService.addUser(user);
          await _dbHelper.markAsSynced(user.id!);
        }
      } catch (e) {
        print("Sync failed: $e");
      }
    }
  }
}
