import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'show_event.dart';
part 'show_state.dart';

class ShowBloc extends Bloc<ShowEvent, ShowState> {
  ShowBloc() : super(ShowInitial());

  @override
  Stream<ShowState> mapEventToState(
    ShowEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
