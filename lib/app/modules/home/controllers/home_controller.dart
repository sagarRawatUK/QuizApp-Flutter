import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiz/app/commons/style/colors.dart';
import 'package:quiz/app/routes/app_pages.dart';
import 'package:quiz/app/services/firestore_service.dart';
import 'package:quiz/app/services/google_auth.dart';

class HomeController extends GetxController {
  FirestoreService firestoreService = FirestoreService();
  GoogleAuth googleAuth = GoogleAuth();
  // User? user;
  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}

  void signInGoogle() async {
    Get.dialog(
        Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        ),
        barrierDismissible: false);
    await googleAuth.signin().then((User user) {
      uploadData(user.uid, user.displayName!);
      GetStorage().write('isLoggedIn', true);
      GetStorage().write('userId', user.uid);

      Get.back();
      Get.offNamed(Routes.QUIZ, arguments: user);
    });
  }

  void uploadData(String id, String name) async {
    await firestoreService.addUser(id, name);
  }
}
