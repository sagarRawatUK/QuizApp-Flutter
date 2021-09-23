import 'package:json_annotation/json_annotation.dart';
import 'package:quiz/app/data/model/question.dart';
part 'result.g.dart';

@JsonSerializable()
class Result {
  String response_code;
  List<Question> results;
  Result({
    required this.response_code,
    required this.results,
  });

  factory Result.fromJson(Map<String, dynamic> data) => _$ResultFromJson(data);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
