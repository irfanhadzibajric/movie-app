part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class FetchMovieDataEvent extends MovieEvent {}

class FetchSingleMovieDataEvent extends MovieEvent {
  final int movieId;
  FetchSingleMovieDataEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
