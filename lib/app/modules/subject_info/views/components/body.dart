import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../global/widget/launcher.dart';

import '../../../../gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../controllers/subject_info_controller.dart';

class SubjectInfoBody {
  final SubjectInfoController controller;
  SubjectInfoBody({required this.controller});

  Widget get remark => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Remark",
                    style: TextStyle(
                      color: Get.theme.colorScheme.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    )),
                controller.subjectInfo.subject.remarkAddBy == ""
                    ? const SizedBox()
                    : _toolTipText(controller.subjectInfo.subject.remarkAddBy)
              ],
            ),
            Text(
              controller.subjectInfo.subject.remark == ""
                  ? "No Remark"
                  : controller.subjectInfo.subject.remark,
              style: Get.theme.textTheme.headline4,
            ),
          ],
        ),
      );

  Widget get room => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Room No",
                    style: TextStyle(
                      color: Get.theme.colorScheme.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    )),
                controller.subjectInfo.subject.roomNoAddBy == ""
                    ? const SizedBox()
                    : _toolTipText(controller.subjectInfo.subject.roomNoAddBy)
              ],
            ),
            Text(
              controller.subjectInfo.subject.roomNo == null
                  ? "Not Available"
                  : controller.subjectInfo.subject.roomNo.toString(),
              style: Get.theme.textTheme.headline4,
            ),
          ],
        ),
      );

  Widget googleLink(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Google Classroom",
                      style: TextStyle(
                        color: Get.theme.colorScheme.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      )),
                  controller.subjectInfo.subject.gLinkAddBy == ""
                      ? const SizedBox()
                      : _toolTipText(controller.subjectInfo.subject.gLinkAddBy),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onLongPress: () =>
                          controller.subjectInfo.subject.googleClassRoomLink !=
                                  ""
                              ? {
                                  Clipboard.setData(ClipboardData(
                                      text: controller.subjectInfo.subject
                                          .googleClassRoomLink)),
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("Link copied to clipboard")))
                                }
                              : null,
                      child: Text(
                        controller.subjectInfo.subject.googleClassRoomLink == ""
                            ? "No Google Classroom Link"
                            : controller
                                .subjectInfo.subject.googleClassRoomLink,
                        style: Get.theme.textTheme.headline4!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  controller.subjectInfo.subject.googleClassRoomLink == ""
                      ? const SizedBox()
                      : GestureDetector(
                          onTap: () => Launcher.launchUrl(
                              context,
                              controller
                                  .subjectInfo.subject.googleClassRoomLink),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              Assets.icons.meet.path,
                              semanticsLabel: 'Google Class Room',
                              // height: 35,
                              width: 25,
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget zoomLink(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Zoom Link",
                      style: TextStyle(
                        color: Get.theme.colorScheme.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      )),
                  controller.subjectInfo.subject.zLinkAddBy == ""
                      ? const SizedBox()
                      : _toolTipText(controller.subjectInfo.subject.zLinkAddBy),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onLongPress: () =>
                          controller.subjectInfo.subject.zoomLink != ""
                              ? {
                                  Clipboard.setData(ClipboardData(
                                    text:
                                        controller.subjectInfo.subject.zoomLink,
                                  )),
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("Link copied to clipboard")))
                                }
                              : null,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          controller.subjectInfo.subject.zoomLink == ""
                              ? "No Zoom Meeting Link"
                              : controller.subjectInfo.subject.zoomLink,
                          style: Get.theme.textTheme.headline4!.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  controller.subjectInfo.subject.zoomLink == ""
                      ? const SizedBox()
                      : GestureDetector(
                          onTap: () => Launcher.launchUrl(
                              context, controller.subjectInfo.subject.zoomLink),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              Assets.icons.zoom.path,
                              semanticsLabel: 'Zoom Meet',
                              // height: 35,
                              width: 30,
                            ),
                          ),
                        ),
                ],
              ),
            ],
          ),
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
              : ElevatedButton.styleFrom(primary: Theme.of(context).cardColor),
          onPressed: () => controller.notificationAdded.value
              ? controller.removeReminder
              : controller.addReminder(controller.subjectInfo, context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                child: Center(child: FaIcon(FontAwesomeIcons.bell)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text(
                  controller.notificationAdded.value
                      ? "Remove Reminder"
                      : "Add Reminder",
                ),
              )
            ],
          ),
        ),
      );

  Tooltip _toolTipText(String text) => Tooltip(
        preferBelow: false,
        message: text.split(",").last,
        child: Text(
          " ~ ${text.split(",").first}",
          textAlign: TextAlign.end,
        ),
      );
}
