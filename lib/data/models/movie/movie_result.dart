import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/models/movie/movie_item.dart';

part 'movie_result.g.dart';

@JsonSerializable()
class MovieResult extends Equatable {
  final int page;
  final List<MoviesItem> results;

  const MovieResult([this.page = 1, this.results = const []]);

  @override
  List<Object> get props => [results];

  factory MovieResult.fromJson(Map<String, dynamic> json) =>
      _$MovieResultFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResultToJson(this);
}
