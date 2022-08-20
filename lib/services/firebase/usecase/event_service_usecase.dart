import 'package:class_link/global/models/event_log/event_log.dart';

import '../../../global/models/event/event.dart';

abstract class EventServiceUsecase {
  Future<void> addEvent(Event event);
  Future<void> deleteEvent(String refId);
  Future<void> updateEvent(String refId, Event event);
  Future<List<Event>> get getAllEvents;
  Future<EventLog> get getEventLog;
  Future<void> updateEventLog(String refId, EventLog eventLog);
}