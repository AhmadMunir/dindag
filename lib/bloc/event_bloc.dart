import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart' as model;
import '../services/services.dart' as service;

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc() : super(EventInitial()) {
    on<EventEvent>((event, emit) async {
      final _response = await service.EventService(http.Client()).fetchEvents();
      emit(_response.status!
          ? EventLoaded(_response.data!)
          : EventError(message: _response.message!));
    });
  }
}
