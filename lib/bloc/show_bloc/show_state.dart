part of 'show_bloc.dart';

@immutable
abstract class ShowState {
  const ShowState();

  List<Object> get props => [];
}

class ShowInitial extends ShowState {
  @override
  List<Object> get props => [];
}

class ShowLoadingState extends ShowState {}

class ShowLoadedState extends ShowState {
  final List<ShowItem> shows;

  ShowLoadedState(this.shows);

  @override
  List<Object> get props => [shows];
}

class ShowErrorState extends ShowState {
  final String message;

  ShowErrorState(this.message);
  @override
  List<Object> get props => [message];
}

class SingleShowLoadingState extends ShowState {}

class SingleShowLoadedState extends ShowState {
  final ShowInfo show;

  SingleShowLoadedState(this.show);

  @override
  List<Object> get props => [show];
}

class SingleShowErrorState extends ShowState {
  final String message;

  SingleShowErrorState(this.message);
  @override
  List<Object> get props => [message];
}
