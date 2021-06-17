import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/data/repositories/resporitory.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final Repository repository;
  MovieBloc({required this.repository}) : super(MovieInitial());

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if (event is FetchMovieDataEvent) {
      try {
        yield MovieLoadingState();
        var movies = await repository.getMovies();
        yield MovieLoadedState(movies['results']);
      } catch (e) {
        yield MovieErrorState(e.toString());
      }
    } else if (event is FetchSingleMovieDataEvent) {
      try {
        yield SingleMovieLoadingState();
        var movie = await repository.getMovieById(event.movieId);
        yield SingleMovieLoadedState(movie);
      } catch (e) {
        yield SingleMovieErrorState(e.toString());
      }
    }
  }
}
