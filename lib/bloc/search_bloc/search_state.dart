part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchMovieLoadingState extends SearchState {}

class SearchMovieLoadedState extends SearchState {
  final List<MoviesItem> movies;

  SearchMovieLoadedState(this.movies);

  @override
  List<Object> get props => [movies];
}

class SearchMovieErrorState extends SearchState {
  final String message;

  SearchMovieErrorState(this.message);
  @override
  List<Object> get props => [message];
}

class SearchShowLoadingState extends SearchState {}

class SearchShowLoadedState extends SearchState {
  final List<ShowItem> shows;

  SearchShowLoadedState(this.shows);

  @override
  List<Object> get props => [shows];
}

class SearchShowErrorState extends SearchState {
  final String message;

  SearchShowErrorState(this.message);
  @override
  List<Object> get props => [message];
}
