import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/time_table/time_table.dart';
import '../controllers/subject_info_controller.dart';
import 'components/appbar.dart';
import 'components/body.dart';

class SubjectInfoView extends GetView<SubjectInfoController> {
  const SubjectInfoView({
    Key? key,
    this.subject,
  }) : super(key: key);

  final Subject? subject;
  MediaQueryData get mqData => MediaQueryData.fromWindow(window);

  @override
  Widget build(BuildContext context) {
    controller.subject = subject;
    return Scaffold(
        body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SubjectInfoAppBar(controller: controller),
        body(context),
      ],
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
                    SubjectInfoBody(controller: controller).remark,
                    SubjectInfoBody(controller: controller).room,
                    const SizedBox(height: 10),
                    SubjectInfoBody(controller: controller).googleLink(context),
                    const SizedBox(height: 10),
                    SubjectInfoBody(controller: controller).zoomLink(context),
                    const SizedBox(height: 10),
                    SubjectInfoBody(controller: controller)
                        .scheduleButtons(context)
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
