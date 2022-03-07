import 'dart:convert';

import 'package:get/get.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../models/notification_payload.dart/notification_payload.dart';
import '../models/time_table/time_table.dart';
import '../modules/subject_info/controllers/subject_info_controller.dart';
import '../modules/subject_info/views/subject_info_view.dart';
import 'auth_service.dart';
import 'firestore_service.dart';

class NotificationService extends GetxService {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final initializationSettingsAndroid =
      const AndroidInitializationSettings('app_notification_icon');
  late final InitializationSettings initializationSettings;
  late final NotificationAppLaunchDetails? notificationAppLaunchDetails;

  @override
  Future<void> onInit() async {
    tz.initializeTimeZones();
    initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    await flutterLocalNotificationsPlugin.initialize(
        InitializationSettings(android: initializationSettingsAndroid),
        onSelectNotification: (String? payload) => _openSubject(payload));

    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      _openSubject(notificationAppLaunchDetails!.payload);
    }
    super.onInit();
  }

  Future<void> _openSubject(String? payload) async {
    if (payload != null) {
      try {
        final notificationPayload =
            NotificationPayload.fromJson(jsonDecode(payload));
        Get.lazyPut<SubjectInfoController>(
          () => SubjectInfoController(),
          tag: SubjectInfoController.TAG,
        );

        try {
          final firestoreService = Get.find<FirestoreService>();
          final userType = Get.find<AuthService>().userType();

          if (userType == UserType.kiitian || userType == UserType.user) {
            final timetable = await firestoreService.batchTimeTable;
            final subject = timetable[DateTime.now().weekday - 1]
                .subjects
                .where(
                    (element) => element.startTime == notificationPayload.time)
                .first;
            Get.to(SubjectInfoView(subject: subject));
          } else {
            final timetable = await firestoreService.personalTimeTable;
            final subject = timetable[DateTime.now().weekday - 1]
                .subjects
                .where(
                    (element) => element.startTime == notificationPayload.time)
                .first;
            Get.to(SubjectInfoView(subject: subject));
          }
        } catch (e) {
          final subject = notificationPayload.subject;
          Get.to(SubjectInfoView(subject: subject));
        }
      } catch (e) {
        null;
      }
    }
  }

  Future<void> cancelNotification(int id) async =>
      await flutterLocalNotificationsPlugin.cancel(id);

  Future<void> cancelAllNotification() async =>
      await flutterLocalNotificationsPlugin.cancelAll();

  Future<List<PendingNotificationRequest>>
      checkPendingNotificationsRequest() async =>
          await flutterLocalNotificationsPlugin.pendingNotificationRequests();

  Future<void> setNotificationForToday(
      NotificationPayload notificationPayload) async {
    if (_validateSubjectSchedule(notificationPayload.time)) {
      final scheduledTime = tz.TZDateTime.now(tz.local).add(
        Duration(
                hours: notificationPayload.time.hour,
                minutes: notificationPayload.time.minute) -
            Duration(
                hours: DateTime.now().hour, minutes: DateTime.now().minute),
      );

      const androidNotificationDetails = AndroidNotificationDetails(
        "class_link",
        "class_link_channel",
        importance: Importance.max,
        priority: Priority.max,
      );

      const notificationDetails =
          NotificationDetails(android: androidNotificationDetails);

      await flutterLocalNotificationsPlugin.zonedSchedule(
        notificationPayload.hashCode,
        notificationPayload.title,
        notificationPayload.body,
        scheduledTime,
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        payload: jsonEncode(notificationPayload.toJson()),
      );
    }
  }

  bool _validateSubjectSchedule(DayTime time) =>
      Duration(hours: time.hour, minutes: time.minute) >
      Duration(hours: DateTime.now().hour, minutes: DateTime.now().minute);

  // String? _notificationBody(Subject subject) {
  //   if (subject.roomNo != null) return "Room number - ${subject.roomNo}";
  //   if (subject.googleClassRoomLink == "" && subject.zoomLink != "") {
  //     return "Join Zoom meeting";
  //   } else if (subject.googleClassRoomLink != "" && subject.zoomLink == "") {
  //     return "Join Google meet";
  //   } else if (subject.googleClassRoomLink != "" && subject.zoomLink != "") {
  //     return "Google meet - Zoom meeting";
  //   } else {
  //     return null;
  //   }
  // }

  Future test() async {
    final k =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    // ignore: unused_local_variable
    for (var element in k) {
      // final a = element.;
    }
  }
}
