part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class FetchSearchMovieEvent extends SearchEvent {
  final String query;
  FetchSearchMovieEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class FetchSearchShowEvent extends SearchEvent {
  final String query;
  FetchSearchShowEvent({required this.query});

  @override
  List<Object> get props => [query];
}
