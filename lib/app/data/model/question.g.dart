// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
    question: json['question'] as String,
    correct_answer: json['correct_answer'] as String,
    incorrect_answers: (json['incorrect_answers'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'question': instance.question,
      'correct_answer': instance.correct_answer,
      'incorrect_answers': instance.incorrect_answers,
    };
