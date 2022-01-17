import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:class_link/app/models/time_table/time_table.dart';
import '../controllers/subject_info_controller.dart';
import 'components/appbar.dart';

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
                    Padding(
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
                                  : Text(
                                      " ~ ${controller.subject.remarkAddBy.split(",").first}",
                                      textAlign: TextAlign.end,
                                    ),
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
                    )
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
