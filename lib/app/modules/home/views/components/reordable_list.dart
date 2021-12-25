import 'package:animations/animations.dart';
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
                    duration: const Duration(milliseconds: 200),
                    child: AnimatedBuilder(
                      animation: dragAnimation,
                      builder: (context, child) => Obx(() =>
                          !homeController.editMode.value
                              ? displayTile(context, item)
                              : editModeTile(context, inDrag, item)),
                    ),
                  ),
                ),
              ),
          footer: Obx(
            () => !homeController.editMode.value
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () => addSubject(context),
                      child: const Text('Add Subject'),
                    ),
                  ),
          ));

  Widget editModeTile(BuildContext context, bool inDrag, Subject item) => Card(
        color: inDrag ? Colors.blue[50] : Colors.white,
        elevation: inDrag ? 2 : .5,
        child: ListTile(
          leading: const Handle(
            child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.drag_indicator)),
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
        closedBuilder: (context, action) => ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Text(
              item.startTime.hour.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          title: Text(item.subjectName),
          subtitle: Text(item.remark == "" ? "No Remark" : item.remark),
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            duration: Duration(seconds: 1),
            content: Text('No Link Available'),
          )),
          onLongPress: () => onLongPress(action),
        ),
        openBuilder: (context, action) => SubjectInfo(
          subject: item,
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
