import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/repositories/resporitory.dart';

part 'show_event.dart';
part 'show_state.dart';

class ShowBloc extends Bloc<ShowEvent, ShowState> {
  final Repository repository;
  ShowBloc({required this.repository}) : super(ShowInitial());

  @override
  Stream<ShowState> mapEventToState(
    ShowEvent event,
  ) async* {
    if (event is FetchShowDataEvent) {
      try {
        yield ShowLoadingState();
        var shows = await repository.getShows();
        yield ShowLoadedState(shows['results']);
      } catch (e) {
        yield ShowErrorState(e.toString());
      }
    } else if (event is FetchSingleShowDataEvent) {
      try {
        yield SingleShowLoadingState();
        var movie = await repository.getShowById(event.showId);
        yield SingleShowLoadedState(movie);
      } catch (e) {
        yield SingleShowErrorState(e.toString());
      }
    }
  }
}
