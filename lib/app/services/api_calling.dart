import 'dart:convert' as convert;

import 'package:dio/dio.dart';
import 'package:quiz/app/data/model/question.dart';
import 'package:quiz/app/services/dio_service.dart';

class ApiCalling {
  static const String apiUrl =
      "https://opentdb.com/api.php?amount=15&difficulty=easy&type=multiple";
  DioService dioService = DioService();

  Future<List<Question>> getQuestions() async {
    Response response;
    try {
      response = await dioService.getRequest(apiUrl);
      if (response.statusCode == 200) {
        List<Question> result = List<Question>.from(
            response.data['results'].map((i) => Question.fromJson(i)));
        return result;
      } else {
        print("There is some error");
      }
    } on Exception catch (e) {
      print(e);
    }
    return [];
  }
}
