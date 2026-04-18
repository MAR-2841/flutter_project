import 'package:cloud_firestore/cloud_firestore.dart';
import 'user_model.dart';
import 'main.dart';

class FirestoreService {
  // Use a getter to avoid accessing FirebaseFirestore.instance during construction
  CollectionReference get usersCollection {
    if (!isFirebaseInitialized) {
      throw Exception("Firebase not initialized");
    }
    return FirebaseFirestore.instance.collection('users');
  }

  Future<void> addUser(User user) async {
    await usersCollection.add({
      'name': user.name,
      'email': user.email,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateUser(String docId, User user) async {
    await usersCollection.doc(docId).update({
      'name': user.name,
      'email': user.email,
    });
  }

  Future<void> deleteUser(String docId) async {
    await usersCollection.doc(docId).delete();
  }

  Future<String?> getDocIdByEmail(String email) async {
    final snapshot = await usersCollection.where('email', isEqualTo: email).limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.first.id;
    }
    return null;
  }
}
