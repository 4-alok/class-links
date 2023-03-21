import 'package:class_link/global/utils/extension.dart';
import 'package:flutter/material.dart';
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
                style: Get.theme.textTheme.headlineMedium),
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
                style: Get.theme.textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      );



}
