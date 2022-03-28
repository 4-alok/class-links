import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../models/notification_payload.dart/notification_payload.dart';
import '../../../models/subject_info/subject_info.dart';
import '../../../models/time_table/time_table.dart';
import 'package:get/get.dart';

import '../../../services/notification/notification_service.dart';

const emptySubjectInfo = SubjectInfo(
    subject: Subject(
      subjectName: "No Info",
      startTime: DayTime(hour: 6, minute: 0),
    ),
    currentWeek: -1);

class SubjectInfoController extends GetxController {
  SubjectInfo? _subjectInfo;
  final notificationAdded = false.obs;

  final notificationService = Get.find<NotificationService>();

  // ignore: constant_identifier_names
  static const String TAG = "subject_info_controller";

  final hour = 6.obs;

  set subjectInfo(SubjectInfo? subjectInfo) =>
      _subjectInfo = (subjectInfo != null) ? subjectInfo : emptySubjectInfo;

  SubjectInfo get subjectInfo => _subjectInfo ?? emptySubjectInfo;

  bool get isDay => hour.value >= 6 && hour.value <= 18;
  // bool get isDusk => hour.value >= 16 && hour.value <= 18;

  Future<bool> get reminderReadyForToday async => await _isReminderAlreadyExists
      .then((value) => notificationAdded.value = value);

  Future<bool> get _isReminderAlreadyExists async {
    await notificationService.updateNotificationList();
    final list = notificationService.pendingNotification.where((element) {
      try {
        final payload =
            NotificationPayload.fromJson(jsonDecode(element.payload!));
        return (payload.currentWeek == DateTime.now().weekday - 1 &&
            payload.time.hour == subjectInfo.subject.startTime.hour);
      } catch (e) {
        return false;
      }
    });
    return list.isNotEmpty;
  }

  bool get isClassOverOrOngoing =>
      DateTime.now().hour >= subjectInfo.subject.startTime.hour;

  Future<void> get removeReminder async {
    await notificationService
        .cancelNotification(subjectInfo.subject.startTime.hour);
    notificationAdded.value = false;
  }

  Future addReminder(SubjectInfo subjectInfo, BuildContext context) async {
    final payload = NotificationPayload(
      title: subjectInfo.subject.subjectName,
      body: "Current Class, click to open",
      currentWeek: subjectInfo.currentWeek,
      time: subjectInfo.subject.startTime,
      // time:
      //     DayTime(hour: DateTime.now().hour, minute: DateTime.now().minute + 1),
      subject: subjectInfo.subject,
      roomNo: subjectInfo.subject.roomNo.toString(),
    );
    await notificationService.setNotificationForToday(payload);
    notificationAdded.value = true;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Reminder added for ${subjectInfo.subject.subjectName}"),
      ),
    );
  }
}
