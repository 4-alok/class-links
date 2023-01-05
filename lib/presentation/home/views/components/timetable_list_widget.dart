import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global/utils/extension.dart';
import '../../../../../services/firebase/models/elective_timetable.dart';
import '../../../../../services/hive/repository/hive_database.dart';
import '../../../../global/models/subject_info/subject_info.dart';
import '../../../../global/models/time_table/time_table.dart';
import '../../../../global/widget/ads_contrainer.dart';
import '../../../subject_info/controllers/subject_info_controller.dart';
import '../../../subject_info/views/subject_info_view.dart';
import '../../controllers/home_controller.dart';
import '../../controllers/timetable_list_utils.dart';
import 'current_class_card.dart';

class TimetableListWidget extends StatelessWidget
    with TimetableListWidgetUtils {
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
  Widget build(BuildContext context) => ListView(
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
                            currentWeek: currentTabIndex))
                    : displayTile(
                        context,
                        currentDay.subjects[index],
                      ),
          ),
          electiveSubject(context),
        ],
      );

  Widget electiveSubject(BuildContext context) =>
      Get.find<HiveDatabase>().userBoxDatasources.userInfo?.year == 3
          ? ValueListenableBuilder<List<ElectiveTimetable>>(
              valueListenable: homeController.electiveSubjects,
              builder: (context, value, child) {
                value.sort((a, b) => a.subjects.first.startTime.hour.compareTo(
                      b.subjects.first.startTime.hour,
                    ));
                return Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      thickness: 1,
                      color: Theme.of(context).brightness == Brightness.light
                          ? Theme.of(context).colorScheme.primary
                          : Colors.white,
                    ),
                  ),
                  ...value
                      .where((element) => element.day == currentDay.day)
                      .map(
                        (e) => (e.subjects.first.startTime.isCurrentTime &&
                                (currentTabIndex == DateTime.now().weekday - 1))
                            ? CurrentClassCard(
                                subjectInfo: SubjectInfo(
                                    subject: e.subjects.first,
                                    currentWeek: currentTabIndex),
                                elective: true,
                              )
                            : displayTile(context, e.subjects.first,
                                elective: true),
                      )
                      .toList(),
                  // const SizedBox(height: 10),
                  // const SizedBox(
                  //     height: 80,
                  //     width: double.maxFinite,
                  //     child: AdsContainer()),
                ]);
              },
            )
          : const SizedBox();

  Widget displayTile(BuildContext context, Subject item,
          {bool elective = false}) =>
      OpenContainer(
        closedElevation: 0,
        closedColor: Get.theme.scaffoldBackgroundColor,
        openColor: Get.theme.scaffoldBackgroundColor,
        middleColor: Get.theme.scaffoldBackgroundColor,
        closedBuilder: (context, action) => ColoredBox(
            color: Get.theme.scaffoldBackgroundColor,
            child: closeBuilder(item, context, elective, action)),
        openBuilder: (context, action) {
          Get.lazyPut<SubjectInfoController>(
            () => SubjectInfoController(),
            tag: SubjectInfoController.TAG,
          );
          return SubjectInfoView(
            subjectInfo:
                SubjectInfo(subject: item, currentWeek: currentTabIndex),
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
                  .headline4!
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
        subtitle:
            displayTileText(item) != "" ? Text(displayTileText(item)) : null,
        trailing: item.roomNo == null
            ? null
            : Text(
                trailingText(item),
                style: Get.theme.textTheme.headline4,
              ),
        onLongPress: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(item.remark == "" ? "No Remark" : item.remark))),
        onTap: action,
      );
}
