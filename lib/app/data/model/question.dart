import 'package:json_annotation/json_annotation.dart';
part 'question.g.dart';

@JsonSerializable()
class Question {
  String question, correct_answer;
  List<String> incorrect_answers;
  Question(
      {required this.question,
      required this.correct_answer,
      required this.incorrect_answers});

  factory Question.fromJson(Map<String, dynamic> data) =>
      _$QuestionFromJson(data);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
