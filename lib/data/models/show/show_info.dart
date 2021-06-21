import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'show_info.g.dart';

@JsonSerializable()
class ShowInfo extends Equatable {
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'created_by')
  final List? createdBy;

  @JsonKey(name: 'episode_run_time')
  final List<int>? episodeRunTime;

  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;

  @JsonKey(name: 'genres')
  final List<Map>? genres;

  @JsonKey(name: 'homepage')
  final String? homepage;

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'in_production')
  final bool? inProduction;

  @JsonKey(name: 'languages')
  final List<String>? languages;

  @JsonKey(name: 'last_air_date')
  final String? lastAirDate;

  @JsonKey(name: 'last_episode_to_air')
  final Map? lastEpisodeToAir;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'next_episode_to_air')
  final Map? nextEpisodeToAir;

  @JsonKey(name: 'networks')
  final List<Map>? networks;

  @JsonKey(name: 'number_of_episodes')
  final int? numberOfEpisodes;

  @JsonKey(name: 'number_of_seasons')
  final int? numberOfSeasons;

  @JsonKey(name: 'origin_country')
  final List<String>? originCountry;

  @JsonKey(name: 'original_language')
  final String? originalLanguage;

  @JsonKey(name: 'original_name')
  final String? originalName;

  @JsonKey(name: 'overview')
  final String? overview;

  @JsonKey(name: 'popularity')
  final double? popularity;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'production_companies')
  final List<Map>? productionCompanies;

  @JsonKey(name: 'production_countries')
  final List<Map>? productionCountries;

  @JsonKey(name: 'seasons')
  final List<Map>? seasons;

  @JsonKey(name: 'spoken_languages')
  final List<Map>? spokenLanguages;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'tagline')
  final String? tagline;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @JsonKey(name: 'vote_count')
  final int? voteCount;

  ShowInfo(
      this.backdropPath,
      this.createdBy,
      this.episodeRunTime,
      this.firstAirDate,
      this.genres,
      this.homepage,
      this.id,
      this.inProduction,
      this.languages,
      this.lastAirDate,
      this.lastEpisodeToAir,
      this.name,
      this.nextEpisodeToAir,
      this.networks,
      this.numberOfEpisodes,
      this.numberOfSeasons,
      this.originCountry,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.seasons,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.type,
      this.voteAverage,
      this.voteCount);

  factory ShowInfo.fromJson(Map<String, dynamic> json) =>
      _$ShowInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ShowInfoToJson(this);

  @override
  List<Object?> get props => throw UnimplementedError();
}
