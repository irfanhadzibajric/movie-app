part of 'movie_bloc.dart';

@immutable
abstract class MovieState {
  const MovieState();

  List<Object> get props => [];
}

class MovieInitial extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieLoadingState extends MovieState {}

class MovieLoadedState extends MovieState {
  final List<MoviesItem> movies;

  MovieLoadedState(this.movies);

  @override
  List<Object> get props => [movies];
}

class MovieErrorState extends MovieState {
  final String message;

  MovieErrorState(this.message);
  @override
  List<Object> get props => [message];
}

class SingleMovieLoadingState extends MovieState {}

class SingleMovieLoadedState extends MovieState {
  final MovieInfo movie;

  SingleMovieLoadedState(this.movie);

  @override
  List<Object> get props => [movie];
}

class SingleMovieErrorState extends MovieState {
  final String message;

  SingleMovieErrorState(this.message);
  @override
  List<Object> get props => [message];
}
