import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quiz/app/services/firestore_service.dart';

class QuizController extends GetxController {
  FirestoreService firestoreService = FirestoreService();
  User? user;
  @override
  void onInit() {
    user = Get.arguments;

    if (user == null) {
      user = FirebaseAuth.instance.currentUser!;
    }
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
