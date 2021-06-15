part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class FetchDataEvent extends MovieEvent {}
