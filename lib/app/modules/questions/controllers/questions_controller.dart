import 'package:get/get.dart';
import 'package:quiz/app/data/model/question.dart';
import 'package:quiz/app/services/api_calling.dart';

class QuestionsController extends GetxController {
  ApiCalling apiCalling = ApiCalling();
  RxInt score = 0.obs;
  RxInt totalSolved = 0.obs;
  List<RxBool> clicked = [
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs
  ].obs;

  List<List<RxInt>> questionsList = [
    [
      0.obs,
      0.obs,
      0.obs,
      0.obs,
    ].obs,
    [
      0.obs,
      0.obs,
      0.obs,
      0.obs,
    ].obs,
    [
      0.obs,
      0.obs,
      0.obs,
      0.obs,
    ].obs,
    [
      0.obs,
      0.obs,
      0.obs,
      0.obs,
    ].obs,
    [
      0.obs,
      0.obs,
      0.obs,
      0.obs,
    ].obs,
    [
      0.obs,
      0.obs,
      0.obs,
      0.obs,
    ].obs,
    [
      0.obs,
      0.obs,
      0.obs,
      0.obs,
    ].obs,
    [
      0.obs,
      0.obs,
      0.obs,
      0.obs,
    ].obs,
    [
      0.obs,
      0.obs,
      0.obs,
      0.obs,
    ].obs,
    [
      0.obs,
      0.obs,
      0.obs,
      0.obs,
    ].obs,
    [
      0.obs,
      0.obs,
      0.obs,
      0.obs,
    ].obs,
    [
      0.obs,
      0.obs,
      0.obs,
      0.obs,
    ].obs,
    [
      0.obs,
      0.obs,
      0.obs,
      0.obs,
    ].obs,
    [
      0.obs,
      0.obs,
      0.obs,
      0.obs,
    ].obs,
    [
      0.obs,
      0.obs,
      0.obs,
      0.obs,
    ].obs
  ];

  @override
  void onInit() {}

  Future<List<Question>> getQuestions() async {
    var result = await apiCalling.getQuestions();
    return result;
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
