import 'package:get/get.dart';
import 'package:quiz/app/routes/app_pages.dart';
import 'package:quiz/app/services/firestore_service.dart';

class ResultController extends GetxController {
  FirestoreService firestoreService = FirestoreService();
  // String score = Get.arguments.toString();
  RxString title = "".obs;
  @override
  void onInit() {
    // uploadScore();
    // if (Get.arguments < 5)
    //   title.value = "Better luck next time";
    // else if (Get.arguments < 10)
    //   title.value = "Good";
    // else if (Get.arguments < 15)
    //   title.value = "Excellent";
    // else if (Get.arguments < 20)
    //   title.value = "Marvellous";
    // else if (Get.arguments == 20) title.value = "Phenomenol";

    Future.delayed(Duration(seconds: 10), () => Get.offNamed(Routes.QUIZ));
  }

  // void uploadScore() async {
  //   await firestoreService.addScore(userId, Get.arguments.toString());
  // }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
