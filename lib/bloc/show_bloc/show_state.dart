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
  // TODO: change dynamic to showresult
  dynamic shows;

  ShowLoadedState(this.shows);

  @override
  List<Object> get props => [shows];
}

class ShowErrorState extends ShowState {
  String message;

  ShowErrorState(this.message);
  @override
  List<Object> get props => [message];
}
