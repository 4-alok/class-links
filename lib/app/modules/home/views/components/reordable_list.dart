import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:class_link/app/models/time_table/time_table.dart';
import 'package:class_link/app/modules/home/controllers/home_controller.dart';
import 'edit_model_sheet.dart';

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
                builder: (context, dragAnimation, inDrag) {
                  return SizeFadeTransition(
                    animation: animation,
                    sizeFraction: 0.7,
                    curve: Curves.easeInOut,
                    child: AnimatedSize(
                      duration: Duration(milliseconds: 200),
                      child: Obx(() => !homeController.editMode.value
                          ? displayTile(context, item)
                          : editModeTile(inDrag, item)),
                    ),
                  );
                },
              ),
          footer: Obx(
            () => !homeController.editMode.value
                ? SizedBox()
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () => addSubject(context),
                      child: Text('Add Subject'),
                    ),
                  ),
          ));

  Widget editModeTile(bool inDrag, Subject item) => Card(
        color: inDrag ? Colors.blue[50] : Colors.white,
        elevation: inDrag ? 2 : .5,
        child: ListTile(
          leading: Handle(
            child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.drag_indicator)),
          ),
          title: Text(item.subjectName),
          subtitle: Text(item.remark == "" ? "No Remark" : item.remark),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => homeController.removeSubject(item, currentDay.day),
          ),
        ),
      );

  Widget displayTile(BuildContext context, Subject item) => ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Text(
            item.startTime.hour.toString(),
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        title: Text(item.subjectName),
        subtitle: Text(item.remark == "" ? "No Remark" : item.remark),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 1),
            content: Text('No Link Available'),
          ));
        },
      );

  void addSubject(BuildContext context) async {
    final editBottomSheet = EditBottomSheet();
    final sub = await editBottomSheet.show(context);
    print(sub);
    if (sub != null) homeController.addSubject(currentDay, sub);
    Future.delayed(
        Duration(milliseconds: 500), () => editBottomSheet.dispose());
  }
}
