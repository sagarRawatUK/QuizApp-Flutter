import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quiz/app/services/firestore_service.dart';

class QuizController extends GetxController {
  FirestoreService firestoreService = FirestoreService();
  User user = Get.arguments;

  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}
}
