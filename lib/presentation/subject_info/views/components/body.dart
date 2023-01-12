import 'package:class_link/global/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../global/models/subject_info/subject_info.dart';
import '../../controllers/subject_info_controller.dart';

class SubjectInfoBody {
  final SubjectInfoController controller;
  SubjectInfoBody({required this.controller});

  Widget teacher(Widget teacher) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Teacher",
                    style: TextStyle(
                      color: Get.theme.colorScheme.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    )),
              ],
            ),
            teacher,
          ],
        ),
      );

  Widget subjectCode(SubjectInfo? subjectInfo) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Subject Code",
                    style: TextStyle(
                      color: Get.theme.colorScheme.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    )),
              ],
            ),
            Text(subjectInfo?.subject.electiveSubjectCode ?? "N/A",
                style: Get.theme.textTheme.headline4),
          ],
        ),
      );

  //A Widget to show time
  Widget time(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Time",
                    style: TextStyle(
                      color: Get.theme.colorScheme.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    )),
              ],
            ),
            Flexible(
              flex: 1,
              child: Text(
                controller.subjectInfo.subject.startTime.startEndTimeRange,
                style: Get.theme.textTheme.headline4,
              ),
            ),
          ],
        ),
      );

  Widget scheduleButtons(BuildContext context) =>
      controller.subjectInfo.currentWeek == DateTime.now().weekday - 1
          ? FutureBuilder<bool>(
              future: controller.reminderReadyForToday,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final res = snapshot.data;
                  return (res == null || controller.isClassOverOrOngoing)
                      ? const SizedBox()
                      : Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Flexible(
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: double.maxFinite,
                                ),
                              ),
                            ),
                            Flexible(
                                flex: 1,
                                child: SizedBox(
                                  width: double.maxFinite,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: _reminderButton(context),
                                  ),
                                )),
                          ],
                        );
                } else {
                  return const SizedBox();
                }
              })
          : const SizedBox();

  Widget _reminderButton(BuildContext context) => Obx(
        () => ElevatedButton(
          style: controller.notificationAdded.value
              ? null
              : ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).cardColor),
          onPressed: () => controller.notificationAdded.value
              ? controller.removeReminder
              : controller.addReminder(controller.subjectInfo, context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.bell,
                    color: Get.theme.textTheme.headline4?.color,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text(
                  controller.notificationAdded.value
                      ? "Remove Reminder"
                      : "Add Reminder",
                  style: Get.theme.textTheme.headline4?.copyWith(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      );
}
