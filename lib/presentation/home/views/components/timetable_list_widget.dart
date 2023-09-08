import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global/utils/extension.dart';
import '../../../../global/models/subject_info/subject_info.dart';
import '../../../../global/models/time_table/time_table.dart';
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
              itemBuilder: (context, index) =>
                  currentDay.subjects[index].startTime.isCurrentTime &&
                          (currentTabIndex == DateTime.now().weekday - 1)
                      ? CurrentClassCard(
                          subjectInfo: SubjectInfo(
                            subject: currentDay.subjects[index],
                            currentWeek: currentTabIndex,
                          ),
                          teacher: Text(
                              currentDay.subjects[index].teacherName ?? noInfo,
                              style: Theme.of(context).textTheme.titleMedium),
                          elective: currentDay.subjects[index].isElective,
                        )
                      : displayTile(
                          context,
                          currentDay.subjects[index],
                          elective: currentDay.subjects[index].isElective,
                        ),
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
                child: Text(item.teacherName ?? noInfo,
                    style: Theme.of(context).textTheme.headlineMedium),
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
        subtitle: Text(item.teacherName ?? 'No info'),
        trailing: item.roomNo == null ? null : trailingText(item.roomNo ?? ""),
        onTap: action,
      );

  // Widget? teacherText(String? subject, [TextStyle? style]) {
  //   if (subject == null) return const Text(noInfo);
  //   final teacherSource = homeController.gSheetService.teacherInfoDatasource;
  //   return FutureBuilder<MyTeachers?>(
  //     future: homeController.hiveDatabase.getFromCacheOrFetch<MyTeachers?>(
  //       checkExpired: true,
  //       duration: const Duration(days: 1),
  //       fetchData:
  //           homeController.gSheetService.teacherInfoDatasource.fetchMyTeachers,
  //     ),
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return const SizedBox();
  //       } else if (snapshot.hasData) {
  //         final String teacher = snapshot.data!.teachers
  //                 .firstWhereOrNull((element) => element.subject == subject)
  //                 ?.name ??
  //             noInfo;
  //         teacherSource.fetchMyTeachers;
  //         return Text(
  //           teacher,
  //           maxLines: 1,
  //           style: style,
  //           overflow: TextOverflow.ellipsis,
  //         );
  //       } else {
  //         return const Text(noInfo);
  //       }
  //     },
  //   );
  // }

  Widget trailingText(String roomNo) {
    if (roomNo.isEmpty) return const SizedBox();
    final last = roomNo.split('-').last;
    final first = roomNo.substring(0, roomNo.length - last.length - 1);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          last,
          style: Get.theme.textTheme.headlineMedium?.copyWith(fontSize: 24),
        ),
        Text(
          first,
          style: Get.theme.textTheme.headlineMedium!
              .copyWith(fontSize: 14, fontWeight: FontWeight.w900),
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
