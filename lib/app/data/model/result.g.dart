// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    response_code: json['response_code'] as String,
    results: (json['results'] as List<dynamic>)
        .map((e) => Question.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'response_code': instance.response_code,
      'results': instance.results,
    };
