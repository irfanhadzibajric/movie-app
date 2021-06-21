import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/models/show/show_item.dart';

part 'show_result.g.dart';

@JsonSerializable()
class ShowResult extends Equatable {
  @JsonKey(name: 'page')
  final int page;
  @JsonKey(name: 'results')
  final List<ShowItem> results;

  ShowResult(this.page, this.results);

  @override
  List<Object> get props => [page, results];

  factory ShowResult.fromJson(Map<String, dynamic> json) =>
      _$ShowResultFromJson(json);

  Map<String, dynamic> toJson() => _$ShowResultToJson(this);
}
