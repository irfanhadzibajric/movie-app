import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
          var movies = await repository.getMovieSearchResult(event.query);
          yield SearchMovieLoadedState(movies['results']);
        } catch (e) {
          yield SearchMovieErrorState(e.toString());
        }
      }
    } else if (event is FetchSearchShowEvent) {
      if (event.query.length > 3) {
        try {
          yield SearchShowLoadingState();
          var movies = await repository.getShowSearchResult(event.query);
          yield SearchShowLoadedState(movies['results']);
        } catch (e) {
          yield SearchShowErrorState(e.toString());
        }
      }
    }
  }
}
