import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/models/movie/movie_item.dart';

part 'movie_result.g.dart';

@JsonSerializable()
class MovieResult extends Equatable {
  @JsonKey(name: 'page')
  final int page;
  @JsonKey(name: 'results')
  final List<MoviesItem> results;

  MovieResult(this.page, this.results);

  @override
  List<Object> get props => [page, results];

  factory MovieResult.fromJson(Map<String, dynamic> json) =>
      _$MovieResultFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResultToJson(this);
}
