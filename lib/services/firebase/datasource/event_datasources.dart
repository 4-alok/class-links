import 'package:class_link/global/models/event/event.dart';
import 'package:class_link/global/models/event_log/event_log.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../usecase/event_service_usecase.dart';

const String evenetKey = 'events';
const String eventLogKey = 'event_log';

class EventDatasources extends GetxService implements EventServiceUsecase {
  final FirebaseFirestore firestore;
  EventDatasources({required this.firestore});

  @override
  Future<void> addEvent(event) async => await firestore
      .collection(evenetKey)
      .add(event.toJson())
      .then((value) async =>
          await firestore.collection(evenetKey).doc(value.id).update(
                event.copyWith(refId: value.id).toJson(),
              ));

  @override
  Future<void> deleteEvent(String refId) async =>
      await firestore.collection(evenetKey).doc(refId).delete();

  @override
  Future<List<Event>> get getAllEvents async =>
      (await firestore.collection(evenetKey).get())
          .docs
          .map((doc) => Event.fromJson(doc.data()))
          .toList();

  @override
  Future<void> updateEvent(String refId, event) async =>
      await firestore.collection(evenetKey).doc(refId).update(event.toJson());

  @override
  Future<EventLog> get getEventLog async => EventLog.fromJson(
      (await firestore.collection(eventLogKey).get()).docs.first.data());

  @override
  Future<void> updateEventLog(String refId, EventLog eventLog) async =>
      await firestore
          .collection(eventLogKey)
          .doc(refId)
          .update(eventLog.toJson());
}
