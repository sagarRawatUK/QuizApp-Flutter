import 'package:get/get.dart';
import 'package:quiz/app/routes/app_pages.dart';
import 'package:quiz/app/services/firestore_service.dart';
import 'package:quiz/app/services/google_auth.dart';

class ResultController extends GetxController {
  FirestoreService firestoreService = FirestoreService();
  GoogleAuth googleAuth = GoogleAuth();
  String score = Get.arguments.toString();
  RxString title = "".obs;
  String userUid = "";

  @override
  void onInit() {
    userUid = googleAuth.getCurrentUserId();

    if (Get.arguments < 5)
      title.value = "Better luck next time";
    else if (Get.arguments < 10)
      title.value = "Good";
    else if (Get.arguments < 15)
      title.value = "Excellent";
    else if (Get.arguments < 20)
      title.value = "Marvellous";
    else if (Get.arguments == 20) title.value = "Phenomenol";
    uploadScore();

    Future.delayed(Duration(seconds: 15), () => Get.offNamed(Routes.QUIZ));
  }

  void uploadScore() async {
    await firestoreService
        .addScore(userUid, Get.arguments.toString())
        .then((value) => print("Score Uploaded"));
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
