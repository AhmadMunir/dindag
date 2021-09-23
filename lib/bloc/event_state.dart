part of 'event_bloc.dart';

@immutable
abstract class EventState {
  final List<model.Event> lists;

  EventState(this.lists);
}

class EventInitial extends EventState {
  EventInitial() : super([]);
}

class EventLoaded extends EventState {
  EventLoaded(List<model.Event> lists) : super(lists);
}

class EventError extends EventState {
  final String? message;
  EventError({this.message}) : super([]);
}
