part of 'show_bloc.dart';

@immutable
abstract class ShowEvent extends Equatable {
  const ShowEvent();

  @override
  List<Object> get props => [];
}

class FetchShowDataEvent extends ShowEvent {}
