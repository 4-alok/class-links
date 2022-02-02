import '../../../../global/widget/launcher.dart';

import '../../../../gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
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
                controller.subject.remarkAddBy == ""
                    ? const SizedBox()
                    : _toolTipText(controller.subject.remarkAddBy)
              ],
            ),
            Text(
              controller.subject.remark == ""
                  ? "No Remark"
                  : controller.subject.remark,
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
                controller.subject.roomNoAddBy == ""
                    ? const SizedBox()
                    : _toolTipText(controller.subject.roomNoAddBy)
              ],
            ),
            Text(
              controller.subject.roomNo == null
                  ? "Not Available"
                  : controller.subject.roomNo.toString(),
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
                  controller.subject.gLinkAddBy == ""
                      ? const SizedBox()
                      : _toolTipText(controller.subject.gLinkAddBy),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      controller.subject.googleClassRoomLink == ""
                          ? "No Google Classroom Link"
                          : controller.subject.googleClassRoomLink,
                      style: Get.theme.textTheme.headline4!.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  controller.subject.googleClassRoomLink == ""
                      ? const SizedBox()
                      : GestureDetector(
                          onTap: () => Launcher.launchUrl(
                              context, controller.subject.googleClassRoomLink),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              Assets.icons.meet.path,
                              semanticsLabel: 'Googel Class Room',
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
                  controller.subject.zLinkAddBy == ""
                      ? const SizedBox()
                      : _toolTipText(controller.subject.zLinkAddBy),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Text(
                        controller.subject.zoomLink == ""
                            ? "No Zoom Meeting Link"
                            : controller.subject.zoomLink,
                        style: Get.theme.textTheme.headline4!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  controller.subject.zoomLink == ""
                      ? const SizedBox()
                      : GestureDetector(
                          onTap: () => Launcher.launchUrl(
                              context, controller.subject.zoomLink),
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

  Tooltip _toolTipText(String text) => Tooltip(
        preferBelow: false,
        message: text.split(",").last,
        child: Text(
          " ~ ${text.split(",").first}",
          textAlign: TextAlign.end,
        ),
      );
}
