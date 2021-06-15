// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResult _$MovieResultFromJson(Map<String, dynamic> json) {
  return MovieResult(
    json['page'] as int,
    (json['results'] as List<dynamic>)
        .map((e) => MoviesItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MovieResultToJson(MovieResult instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };
