import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';

import 'package:class_link/app/models/time_table/time_table.dart';
import 'package:class_link/app/modules/home/controllers/home_controller.dart';

class MyReordableLIst extends StatelessWidget {
  final HomeController homeController;
  final Day currentDay;
  const MyReordableLIst({
    Key? key,
    required this.homeController,
    required this.currentDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImplicitlyAnimatedReorderableList<Subject>(
        areItemsTheSame: (a, b) => a.subjectName == b.subjectName,
        onReorderFinished: (_subject, from, to, _subjects) {},
        items: currentDay.subjects,
        itemBuilder: (context, animation, item, index) => Reorderable(
              key: ValueKey(item),
              builder: (context, dragAnimation, inDrag) {
                return SizeFadeTransition(
                  animation: animation,
                  sizeFraction: 0.7,
                  curve: Curves.easeInOut,
                  child: Card(
                    color: inDrag ? Colors.blue[50] : Colors.white,
                    elevation: inDrag ? 2 : 0,
                    child: ListTile(
                      leading: Handle(
                        child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Icon(Icons.drag_indicator)),
                      ),
                      title: Text(item.subjectName),
                      subtitle: Text(item.remark),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () =>
                            homeController.removeSubject(item, currentDay.day),
                      ),
                    ),
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
                    onPressed: () {

                      // TODO: add bottom sheet here
                      
                      final subjectT = Subject(
                        subjectName: 'Subject Name',
                        startTime: DateTime.now(),
                        remark: "",
                      );

                      homeController.addSubject(currentDay, subjectT);
                    },
                    child: Text('Add Subject'),
                  ),
                ),
        ));
  }
}
