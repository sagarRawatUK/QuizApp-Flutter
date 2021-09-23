import 'package:get/get.dart';
import 'package:quiz/app/routes/app_pages.dart';
import 'package:quiz/app/services/firestore_service.dart';

class ResultController extends GetxController {
  FirestoreService firestoreService = FirestoreService();
  String userId = Get.arguments[1];
  RxString title = "".obs;
  @override
  void onInit() {
    uploadScore();

    if (Get.arguments[0] < 5)
      title.value = "Better luck next time";
    else if (Get.arguments[0] < 10)
      title.value = "Good";
    else if (Get.arguments[0] < 15)
      title.value = "Excellent";
    else if (Get.arguments[0] < 20)
      title.value = "Marvellous";
    else if (Get.arguments[0] == 20) title.value = "Phenomenol";

    Future.delayed(Duration(seconds: 7));
    Get.offNamed(Routes.HOME);
  }

  void uploadScore() async {
    await firestoreService.addScore(userId, Get.arguments[0].toString());
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
