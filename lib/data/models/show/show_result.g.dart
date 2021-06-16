// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowResult _$ShowResultFromJson(Map<String, dynamic> json) {
  return ShowResult(
    json['page'] as int,
    (json['results'] as List<dynamic>)
        .map((e) => ShowItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ShowResultToJson(ShowResult instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
