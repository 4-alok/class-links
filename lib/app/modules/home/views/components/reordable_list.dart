import 'package:animations/animations.dart';
import 'package:class_link/app/utils/color.dart';
import 'package:class_link/app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:class_link/app/models/time_table/time_table.dart';
import 'package:class_link/app/modules/home/controllers/home_controller.dart';
import 'package:vibration/vibration.dart';
import 'edit_model_sheet.dart';
import 'subject_info_page.dart';

class MyReordableLIst extends StatelessWidget {
  final HomeController homeController;
  final Day currentDay;
  const MyReordableLIst({
    Key? key,
    required this.homeController,
    required this.currentDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ImplicitlyAnimatedReorderableList<Subject>(
          areItemsTheSame: (a, b) => a.subjectName == b.subjectName,
          onReorderFinished: (a, b, c, d) =>
              homeController.finishReorder(a, b, c, d, currentDay.day),
          items: currentDay.subjects,
          itemBuilder: (context, animation, item, index) => Reorderable(
                key: ValueKey(item),
                builder: (context, dragAnimation, inDrag) => SizeFadeTransition(
                  animation: animation,
                  sizeFraction: 0.7,
                  curve: Curves.easeInOut,
                  child: AnimatedSize(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 200),
                    child: AnimatedBuilder(
                        animation: dragAnimation,
                        builder: (context, child) => Obx(
                              () => homeController.editMode.value
                                  ? editModeTile(context, inDrag, item)
                                  : (index == 2)
                                      ? currentTimeTile(context, item)
                                      : displayTile(context, item),
                            )),
                  ),
                ),
              ),
          footer: Obx(
            () => !homeController.editMode.value
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () => addSubject(context),
                      child: const Text('Add Subject'),
                    ),
                  ),
          ));

  Widget editModeTile(BuildContext context, bool inDrag, Subject item) => Card(
        color: inDrag
            ? Theme.of(context).secondaryHeaderColor
            : BlendColor.cardColor(context),
        elevation: inDrag ? 2 : .5,
        child: ListTile(
          leading: Handle(
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.drag_indicator,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          title: Text(item.subjectName),
          subtitle: Text(item.remark == "" ? "No Remark" : item.remark),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => homeController.removeSubject(item, currentDay.day),
          ),
          onTap: () => addSubject(context, item),
        ),
      );

  Widget displayTile(BuildContext context, Subject item) => OpenContainer(
        closedColor: Theme.of(context).scaffoldBackgroundColor,
        openColor: Theme.of(context).scaffoldBackgroundColor,
        middleColor: Theme.of(context).scaffoldBackgroundColor,
        closedBuilder: (context, action) => Theme(
          data: Theme.of(context).copyWith(
              cardColor: Colors.transparent,
              listTileTheme: ListTileThemeData(
                tileColor: Theme.of(context).backgroundColor,
              )),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Text(
                item.startTime.hourString,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
            title: Text(item.subjectName),
            subtitle: Text(item.remark == "" ? "No Remark" : item.remark),
            onTap: () =>
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(seconds: 1),
              content: Text('No Link Available'),
            )),
            onLongPress: () => onLongPress(action),
          ),
        ),
        openBuilder: (context, action) => SubjectInfo(
          subject: item,
        ),
      );

  Widget currentTimeTile(BuildContext context, Subject item) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: OpenContainer(
          closedElevation: 10,
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          closedColor: Theme.of(context).scaffoldBackgroundColor,
          openColor: Theme.of(context).scaffoldBackgroundColor,
          middleColor: Theme.of(context).scaffoldBackgroundColor,
          closedBuilder: (context, action) => SizedBox(
              width: double.maxFinite,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        Container(
                          height: 23,
                          width: 4,
                          color: Theme.of(context).colorScheme.secondaryVariant,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          item.startTime.text12HourStartEnd,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: Get.theme.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          openBuilder: (context, action) => SubjectInfo(
            subject: item,
          ),
        ),
      );

  onLongPress(VoidCallback action) async {
    if ((await Vibration.hasVibrator()) ?? false) {
      Vibration.vibrate();
      if ((await Vibration.hasAmplitudeControl()) ?? false) {
        Vibration.vibrate(
          duration: 20,
          amplitude: 100,
        );
      }
    }
    action();
  }

  void addSubject(BuildContext context, [Subject? _subject]) async {
    // TODO: need proper dispose.
    final editBottomSheet = EditBottomSheet();
    final sub = await editBottomSheet.show(context, _subject);
    if (sub != null) {
      if (_subject != null) {
        homeController.updateSubject(currentDay.day, _subject, sub);
      } else {
        homeController.addSubject(currentDay, sub);
      }
    }
    Future.delayed(
        const Duration(milliseconds: 500), () => editBottomSheet.dispose());
  }
}
