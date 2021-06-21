import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/movie/movie_item.dart';
import 'package:movie_app/data/models/movie/movie_result.dart';
import 'package:movie_app/data/models/show/show_item.dart';
import 'package:movie_app/data/models/show/show_result.dart';
import 'package:movie_app/data/repository/resporitory.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Repository repository;
  SearchBloc({required this.repository}) : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is FetchSearchMovieEvent) {
      if (event.query.length > 3) {
        try {
          yield SearchMovieLoadingState();
          MovieResult movies =
              await repository.getMovieSearchResult(event.query);
          List<MoviesItem> movieItems = movies.results;
          yield SearchMovieLoadedState(movieItems);
        } catch (e) {
          yield SearchMovieErrorState(e.toString());
        }
      }
    } else if (event is FetchSearchShowEvent) {
      if (event.query.length > 3) {
        try {
          yield SearchShowLoadingState();
          ShowResult shows = await repository.getShowSearchResult(event.query);
          List<ShowItem> showItems = shows.results;
          yield SearchShowLoadedState(showItems);
        } catch (e) {
          yield SearchShowErrorState(e.toString());
        }
      }
    }
  }
}
