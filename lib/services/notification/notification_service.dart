import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    hide Message;

import 'package:get/get.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../firebase_options.dart';
import '../../global/models/notification_payload.dart/notification_payload.dart';
import '../../global/models/time_table/time_table.dart';
import '../../global/utils/get_snackbar.dart';
import 'notification_utils.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  description: 'This channel is used for important notifications.',
  importance: Importance.high,
);

class NotificationService extends GetxService with NotificationServiceUtils {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final initializationSettingsAndroid =
      const AndroidInitializationSettings('app_notification_icon');
  late final InitializationSettings initializationSettings;
  late final NotificationAppLaunchDetails? notificationAppLaunchDetails;

  List<PendingNotificationRequest> pendingNotification = [];

  @override
  Future<void> onInit() async {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    tz.initializeTimeZones();
    initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    await flutterLocalNotificationsPlugin.initialize(
        InitializationSettings(android: initializationSettingsAndroid),
        onSelectNotification: (String? payload) => openSubject(payload));

    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      openSubject(notificationAppLaunchDetails!.payload);
    }
    updateNotificationList();
    super.onInit();
  }

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    await Future.delayed(const Duration(seconds: 30));
    Message("Background message", message.data.toString());
    print("Message data: ${message.data}");
    print('Handling a background Notification, id:${message.messageId}');
  }

  Future<void> updateNotificationList() async =>
      await checkPendingNotificationsRequest()
          .then((list) => pendingNotification = list);

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
        notificationPayload.time.hour,
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

  // Future test() async {
  //   final k =
  //       await flutterLocalNotificationsPlugin.pendingNotificationRequests();
  //   // ignore: unused_local_variable
  //   for (var element in k) {
  //     // final a = element.;
  //   }
  // }
}
