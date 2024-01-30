import 'package:animations/animations.dart';
import '../../../../global/utils/extension.dart';
import '../../../../global/widget/frost_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';

import '../../../../global/models/subject_info/subject_info.dart';
import '../../../subject_info/controllers/subject_info_controller.dart';
import '../../../subject_info/views/subject_info_view.dart';

class CurrentClassCard extends StatelessWidget {
  final SubjectInfo subjectInfo;
  final bool elective;
  final Widget teacher;
  const CurrentClassCard(
      {Key? key,
      required this.teacher,
      required this.subjectInfo,
      this.elective = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        child: OpenContainer(
          closedElevation: 0,
          closedColor: Theme.of(context).scaffoldBackgroundColor,
          openColor: Theme.of(context).scaffoldBackgroundColor,
          middleColor: Theme.of(context).scaffoldBackgroundColor,
          closedBuilder: (context, action) => closeTile(action, context),
          openBuilder: (context, action) {
            Get.lazyPut<SubjectInfoController>(() => SubjectInfoController(),
                tag: SubjectInfoController.TAG);
            return SubjectInfoView(subjectInfo: subjectInfo, teacher: teacher);
          },
        ),
      );

  Widget closeTile(VoidCallback action, BuildContext context) => Container(
        color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(.2),
        child: FrostCard(
          radius: 5,
          margin: EdgeInsets.zero,
          sigma: 4,
          transparent: true,
          borderColor: Get.theme.primaryColor,
          child: InkWell(
            radius: 0,
            onTap: () {
              switch (subjectInfo.subject.subjectName) {
                case "PPLE":
                  launch('https://meet.google.com/kiq-cghb-moe');
                  break;
                case "HRM":
                  launch('https://meet.google.com/ucw-heuq-ura');
                  break;
                default:
                  action();
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        color: Theme.of(context)
                            .colorScheme
                            .secondaryContainer
                            .withOpacity(.1),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 23,
                              width: 4,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              subjectInfo.subject.startTime.startEndTimeRange,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Get.theme.primaryColor),
                            ),
                          ],
                        ),
                      ),
                      elective
                          ? Text(
                              "Elective Subject",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            subjectInfo.subject.subjectName,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                        trailingWidget,
                      ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: teacher,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      );

  Widget get trailingWidget {
    if (subjectInfo.subject.subjectName == "PPLE" ||
        subjectInfo.subject.subjectName == "HRM") {
      return SvgPicture.asset('assets/icons/meet.svg', height: 40, width: 40);
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          subjectInfo.subject.roomNo != null
              ? Text(
                  subjectInfo.subject.roomNo.toString(),
                  style: Get.theme.textTheme.displaySmall!.copyWith(
                    color: Get.theme.colorScheme.primary,
                  ),
                )
              : const SizedBox(),
        ],
      );
    }
  }
}
