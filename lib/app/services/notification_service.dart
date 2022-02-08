import 'dart:convert';

import 'package:get/get.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../models/time_table/time_table.dart';
import '../modules/subject_info/controllers/subject_info_controller.dart';
import '../modules/subject_info/views/subject_info_view.dart';

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

  void _openSubject(String? payload) {
    if (payload != null) {
      try {
        final subject = Subject.fromJson(jsonDecode(payload));
        Get.lazyPut<SubjectInfoController>(
          () => SubjectInfoController(),
          tag: SubjectInfoController.TAG,
        );
        Get.to(SubjectInfoView(subject: subject));
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

  Future<void> setNotificationForToday(Subject subject) async {
    if (_validateSubjectSchedule(subject)) {
      final scheduledtime = tz.TZDateTime.now(tz.local).add(
        Duration(hours: subject.startTime.hour) -
            Duration(
                hours: DateTime.now().hour, minutes: DateTime.now().minute),
      );

      final androidNotificationDetails = AndroidNotificationDetails(
        "class_link",
        "class_link",
        channelDescription:
            "Notification for ${subject.subjectName}, Class Link",
        importance: Importance.max,
        priority: Priority.max,
      );

      final notificationDetails =
          NotificationDetails(android: androidNotificationDetails);

      await flutterLocalNotificationsPlugin.zonedSchedule(
        subject.hashCode,
        subject.subjectName,
        _notificationBody(subject) ?? "Current Class",
        scheduledtime,
        notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
        payload: jsonEncode(subject.toJson()),
      );
    }
  }

  // Future<bool> isScheduleForToday(Subject subject) async {
  //   final pendingNotificationRequests =
  //       await flutterLocalNotificationsPlugin.pendingNotificationRequests();
  //   final isScheduleForToday =
  //       pendingNotificationRequests.map((e) => e.id).contains(subject.hashCode);
  //   return isScheduleForToday;
  // }

  bool _validateSubjectSchedule(Subject subject) =>
      Duration(hours: subject.startTime.hour) >
      Duration(hours: DateTime.now().hour, minutes: DateTime.now().minute);

  String? _notificationBody(Subject subject) {
    if (subject.roomNo != null) return "Room number - ${subject.roomNo}";
    if (subject.googleClassRoomLink == "" && subject.zoomLink != "") {
      return "Join Zoom meeting";
    } else if (subject.googleClassRoomLink != "" && subject.zoomLink == "") {
      return "Join Google meet";
    } else if (subject.googleClassRoomLink != "" && subject.zoomLink != "") {
      return "Google meet - Zoom meeting";
    } else {
      return null;
    }
  }

  Future test() async {
    final k =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    for (var element in k) {
      // final a = element.;
    }
  }
}
