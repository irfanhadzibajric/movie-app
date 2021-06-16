import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/models/show/show_item.dart';

part 'show_result.g.dart';

@JsonSerializable()
class ShowResult extends Equatable {
  final int page;
  final List<ShowItem> results;

  const ShowResult([this.page = 1, this.results = const []]);

  @override
  List<Object> get props => [results];

  factory ShowResult.fromJson(Map<String, dynamic> json) =>
      _$ShowResultFromJson(json);

  Map<String, dynamic> toJson() => _$ShowResultToJson(this);
}
