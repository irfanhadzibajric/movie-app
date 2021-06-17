part of 'show_bloc.dart';

@immutable
abstract class ShowEvent extends Equatable {
  const ShowEvent();

  @override
  List<Object> get props => [];
}

class FetchShowDataEvent extends ShowEvent {}

class FetchSingleShowDataEvent extends ShowEvent {
  final int showId;
  FetchSingleShowDataEvent({required this.showId});

  @override
  List<Object> get props => [showId];
}
