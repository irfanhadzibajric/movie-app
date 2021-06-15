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
  // TODO: change dynamic to movieresult
  dynamic movies;

  MovieLoadedState(this.movies);

  @override
  List<Object> get props => [movies];
}

class MovieErrorState extends MovieState {
  String message;

  MovieErrorState(this.message);
  @override
  List<Object> get props => [message];
}
