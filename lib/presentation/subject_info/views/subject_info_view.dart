import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../global/models/subject_info/subject_info.dart';
import '../controllers/subject_info_controller.dart';
import 'components/appbar.dart';
import 'components/body.dart';

class SubjectInfoView extends GetView<SubjectInfoController> {
  const SubjectInfoView({Key? key, this.subjectInfo, this.teacher})
      : super(key: key);
  final Widget? teacher;
  final SubjectInfo? subjectInfo;

  MediaQueryData get mqData => MediaQueryData.fromView(window);

  @override
  Widget build(BuildContext context) {
    controller.subjectInfo = subjectInfo;
    return Scaffold(
        body: NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          if (notification.metrics.pixels < -100) {
            Get.back();
          }
        }
        return true;
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SubjectInfoAppBar(controller: controller),
          body(context),
        ],
      ),
    ));
  }

  SliverFillRemaining body(BuildContext context) => SliverFillRemaining(
        fillOverscroll: true,
        hasScrollBody: false,
        child: Theme(
          data: Get.theme.copyWith(
            cardColor: Color.alphaBlend(
                Get.theme.colorScheme.primary
                    .withAlpha(5 * (Get.isDarkMode ? 4 : 3)),
                Get.theme.cardColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                SizedBox(
                  height: mqData.size.height -
                      (AppBar().preferredSize.height +
                          mqData.padding.top +
                          mqData.padding.bottom),
                ),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    SubjectInfoBody(controller: controller)
                        .teacher(teacher ?? const SizedBox()),
                    subjectInfo?.subject.isElective
                        ? SubjectInfoBody(controller: controller)
                            .subjectCode(subjectInfo)
                        : const SizedBox(),
                    const SizedBox(height: 10),
                    SubjectInfoBody(controller: controller).time(context),
                    const SizedBox(height: 10),
                    SubjectInfoBody(controller: controller).room(context),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  @override
  String? get tag => SubjectInfoController.TAG;
}
