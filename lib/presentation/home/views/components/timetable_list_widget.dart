import 'package:animations/animations.dart';
import 'package:class_link/services/gsheet/repository/gsheet_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global/utils/extension.dart';
import '../../../../global/models/subject_info/subject_info.dart';
import '../../../../global/models/time_table/time_table.dart';
import '../../../../services/gsheet/models/my_teacher_model.dart';
import '../../../subject_info/controllers/subject_info_controller.dart';
import '../../../subject_info/views/subject_info_view.dart';
import '../../controllers/home_controller.dart';
import 'current_class_card.dart';

const String noInfo = "No Info";

class TimetableListWidget extends StatelessWidget {
  final HomeController homeController;
  final int currentTabIndex;
  final Day currentDay;
  const TimetableListWidget(
      {Key? key,
      required this.homeController,
      required this.currentTabIndex,
      required this.currentDay})
      : super(key: key);

  @override
  Widget build(BuildContext context) => currentDay.subjects.isEmpty
      ? noClassesWidget(context)
      : ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: currentDay.subjects.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return currentDay.subjects[index].startTime.isCurrentTime &&
                        (currentTabIndex == DateTime.now().weekday - 1)
                    ? CurrentClassCard(
                        subjectInfo: SubjectInfo(
                          subject: currentDay.subjects[index],
                          currentWeek: currentTabIndex,
                        ),
                        teacher: currentDay.subjects[index].isElective
                            ? Text(
                                currentDay.subjects[index].teacherName ??
                                    noInfo,
                                style: Theme.of(context).textTheme.titleMedium)
                            : teacherText(
                                    currentDay.subjects[index].subjectName,
                                    Get.theme.textTheme.headlineMedium) ??
                                const SizedBox(),
                        elective: currentDay.subjects[index].isElective,
                      )
                    : displayTile(
                        context,
                        currentDay.subjects[index],
                        elective: currentDay.subjects[index].isElective,
                      );
              },
            ),
          ],
        );

  Widget displayTile(BuildContext context, Subject item,
          {bool elective = false}) =>
      OpenContainer(
        transitionType: ContainerTransitionType.fade,
        closedElevation: 0,
        closedColor: Colors.transparent,
        openColor: Get.theme.scaffoldBackgroundColor,
        middleColor: Get.theme.scaffoldBackgroundColor,
        closedBuilder: (context, action) => ColoredBox(
            color: Colors.transparent,
            child: closeBuilder(item, context, elective, action)),
        openBuilder: (context, action) {
          Get.lazyPut<SubjectInfoController>(
            () => SubjectInfoController(),
            tag: SubjectInfoController.TAG,
          );
          return SubjectInfoView(
            subjectInfo:
                SubjectInfo(subject: item, currentWeek: currentTabIndex),
            teacher: AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: SizedBox(
                width: double.maxFinite,
                child: item.isElective
                    ? Text(item.teacherName ?? noInfo,
                        style: Theme.of(context).textTheme.headlineMedium)
                    : teacherText(item.subjectName,
                            Get.theme.textTheme.headlineMedium) ??
                        const SizedBox(),
              ),
            ),
          );
        },
      );

  ListTile closeBuilder(Subject item, BuildContext context, bool elective,
          VoidCallback action) =>
      ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Text(item.startTime.hourString,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Theme.of(context).colorScheme.primary)),
        ),
        title: elective
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(tag: "subject_name", child: Text(item.subjectName)),
                  const SizedBox(width: 5),
                  Text(
                    "Elective",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  )
                ],
              )
            : Hero(tag: "subject_name", child: Text(item.subjectName)),
        subtitle: elective
            ? Text(item.teacherName ?? 'No info')
            : teacherText(item.subjectName),
        trailing: item.roomNo == null ? null : trailingText(item.roomNo ?? ""),
        onTap: action,
      );

  Widget? teacherText(String? subject, [TextStyle? style]) {
    if (subject == null) return const Text(noInfo);
    final teacherSource = Get.find<GSheetService>().teacherInfoDatasource;
    return FutureBuilder<MyTeachers?>(
      future: teacherSource.getMyTeachersCached,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        } else if (snapshot.hasData) {
          final String teacher = snapshot.data!.teachers
                  .firstWhereOrNull((element) => element.subject == subject)
                  ?.name ??
              noInfo;
          teacherSource.fetchMyTeachers;
          return Text(
            teacher,
            maxLines: 1,
            style: style,
            overflow: TextOverflow.ellipsis,
          );
        } else {
          return FutureBuilder<MyTeachers>(
              future: teacherSource.fetchMyTeachers,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final String teacher = snapshot.data!.teachers
                          .firstWhereOrNull(
                              (element) => element.subject == subject)
                          ?.name ??
                      noInfo;
                  return Text(teacher, style: style);
                } else {
                  return const SizedBox();
                }
              });
        }
      },
    );
  }

  Widget trailingText(String roomNo) {
    final last = roomNo.split('-').last;
    final first = roomNo.substring(0, roomNo.length - last.length - 1);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          last,
          style: Get.theme.textTheme.headlineMedium,
        ),
        Text(
          first,
          style: Get.theme.textTheme.headlineMedium!
              .copyWith(fontSize: 10, fontWeight: FontWeight.w900),
        ),
      ],
    );
  }

  Widget noClassesWidget(BuildContext context) => Column(
        children: [
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              border:
                  Border.all(width: 2, color: Theme.of(context).primaryColor),
              color: Colors.transparent,
            ),
            padding: const EdgeInsets.all(20),
            child: Text("No Classes",
                style: Get.textTheme.titleLarge?.copyWith(
                  color: Get.theme.primaryColor,
                )),
          ),
        ],
      );
}
