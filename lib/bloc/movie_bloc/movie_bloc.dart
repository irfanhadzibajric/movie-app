import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/data/models/movie/movie_info.dart';
import 'package:movie_app/data/models/movie/movie_item.dart';
import 'package:movie_app/data/models/movie/movie_result.dart';
import 'package:movie_app/data/repository/resporitory.dart';

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
        MovieResult movies = await repository.getMovies();
        List<MoviesItem> movieItems = movies.results.getRange(0, 10).toList();
        yield MovieLoadedState(movieItems);
      } catch (e) {
        yield MovieErrorState(e.toString());
      }
    } else if (event is FetchSingleMovieDataEvent) {
      try {
        yield SingleMovieLoadingState();
        MovieInfo movie = await repository.getMovieById(event.movieId);
        yield SingleMovieLoadedState(movie);
      } catch (e) {
        yield SingleMovieErrorState(e.toString());
      }
    }
  }
}
