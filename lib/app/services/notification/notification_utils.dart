import 'dart:convert';

import 'package:get/get.dart';

import '../../models/notification_payload.dart/notification_payload.dart';
import '../../models/subject_info/subject_info.dart';
import '../../models/time_table/time_table.dart';
import '../../modules/subject_info/controllers/subject_info_controller.dart';
import '../../modules/subject_info/views/subject_info_view.dart';
import '../../utils/get_snackbar.dart';
import '../auth/auth_service.dart';
import '../firebase/firestore_service.dart';

abstract class NotificationServiceUtils {
  Future<void> openSubject(String? payload) async {
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
                .where((element) =>
                    element.startTime.hour == notificationPayload.time.hour)
                .first;
            Get.to(() => SubjectInfoView(
                    subjectInfo: SubjectInfo(
                  subject: subject,
                  currentWeek: notificationPayload.currentWeek,
                )));
          } else {
            final timetable = await firestoreService.personalTimeTable;
            final subject = timetable[DateTime.now().weekday - 1]
                .subjects
                .where(
                    (element) => element.startTime == notificationPayload.time)
                .first;
            Get.to(() => SubjectInfoView(
                    subjectInfo: SubjectInfo(
                  subject: subject,
                  currentWeek: notificationPayload.currentWeek,
                )));
          }
        } catch (e) {
          Message("Unable to fetch subject information", "$e");

          Get.to(
            () => SubjectInfoView(
              subjectInfo: SubjectInfo(
                subject: notificationPayload.subject ??
                    const Subject(
                      subjectName: "No Info",
                      startTime: DayTime(hour: 6, minute: 0),
                    ),
                currentWeek: notificationPayload.currentWeek,
              ),
            ),
          );
        }
      } catch (e) {
        Message("Something went wrong", "$e");
      }
    }
  }
}
