import 'package:quiz/app/modules/result/views/result_view.dart';
import 'package:quiz/app/modules/result/bindings/result_binding.dart';
import 'package:quiz/app/modules/questions/views/questions_view.dart';
import 'package:quiz/app/modules/questions/bindings/questions_binding.dart';
import 'package:quiz/app/modules/quiz/views/quiz_view.dart';
import 'package:quiz/app/modules/quiz/bindings/quiz_binding.dart';
import 'package:quiz/app/modules/home/views/home_view.dart';
import 'package:quiz/app/modules/home/bindings/home_binding.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  
static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME, 
      page:()=> HomeView(), 
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.QUIZ, 
      page:()=> QuizView(), 
      binding: QuizBinding(),
    ),
    GetPage(
      name: Routes.QUESTIONS, 
      page:()=> QuestionsView(), 
      binding: QuestionsBinding(),
    ),
    GetPage(
      name: Routes.RESULT, 
      page:()=> ResultView(), 
      binding: ResultBinding(),
    ),
  ];
}