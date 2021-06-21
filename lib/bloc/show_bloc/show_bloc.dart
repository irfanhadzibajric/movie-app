import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/show/show_info.dart';
import 'package:movie_app/data/models/show/show_item.dart';
import 'package:movie_app/data/models/show/show_result.dart';
import 'package:movie_app/data/repository/resporitory.dart';

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
        ShowResult shows = await repository.getShows();
        List<ShowItem> showItems = shows.results.getRange(0, 10).toList();
        yield ShowLoadedState(showItems);
      } catch (e) {
        yield ShowErrorState(e.toString());
      }
    } else if (event is FetchSingleShowDataEvent) {
      try {
        yield SingleShowLoadingState();
        ShowInfo show = await repository.getShowById(event.showId);
        yield SingleShowLoadedState(show);
      } catch (e) {
        yield SingleShowErrorState(e.toString());
      }
    }
  }
}
