import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  Future<void> addUser(
    String userId,
    String name,
  ) async {
    await users.doc(userId).set({
      "userId": userId,
      "name": name,
    });
  }

  Future<void> addScore(String userId, String score) async {
    await users
        .doc(userId)
        .collection("score")
        .doc(DateTime.now().toString())
        .set({"score": score});
  }

  Future<void> getScore(
    String userId,
  ) async {
    await users.doc(userId).collection("score").get();
  }
}
